# frozen_string_literal: true

require "csv"

class LocodeImporter
  UNZIPPED_DIR = Rails.application.credentials[:zip_dir]

  LocodeImporterError = Class.new(StandardError)

  def run
    import_csv_data
  end

  private

  def import_csv_data
    Dir.glob("#{UNZIPPED_DIR}*.csv") do |file|
      if file.include?("CodeListPart")
        CSV.parse(File.open(file, "r:ISO-8859-1")) do |row|
          add_country(row) if country_data?(row)
          add_locode(row) if locode_data?(row)
        end
      end
    end
  rescue StandardError
    raise LocodeImporterError
  end

  # column 1 and 3 for current row identifies a country data row
  def country_data?(row)
    !row[1].nil? && !row[3].nil? && row[3][0] == "."
  end

  # column 2 for current row identifies a locode row
  def locode_data?(row)
    !row[2].nil?
  end

  def add_country(row)
    Country.find_or_create_by!(code: row[1], name: row[3].gsub(".", ""))
  end

  def add_locode(row)
    attributes = mount_object(row)
    locode = Locode.new(attributes)
    locode.save!
  end

  def mount_object(row)
    location_object(row).merge!(locode_attributes(row[6])).merge!(full_name(row))
  end

  def location_object(row)
    {
      change_marker: row[0],
      country_id: find_country(row[1]),
      city_code: row[2],
      subdivision: row[5],
      status: row[7],
      date: row[8],
      iata: row[9],
      coordinates: row[10],
      remarks: row[11],
      geo_coordinates: ActiveRecord::Point.new(latitude_info(row[10]), longitude_info(row[10]))
    }
  end

  def find_country(id)
    Country.find_by(code: id).id
  end

  # Column FUNCTION sample input: "--34-6--"
  # This column contains a 8-digit function classifier code for the location, where:
  #
  # 0 = A value "0" in the first position specifies that the functional use of a location is not known and is to be
  #     specified.
  # 1 = Specifies that the location is a Port, as defined in UN/ECE Recommendation 16.
  # 2 = Specifies that the location is a Rail terminal.
  # 3 = Specifies that the location is a Road terminal.
  # 4 = Specifies that the location is an Airport.
  # 5 = Specifies that the location is a Postal exchange office.
  # 6 = Value reserved for multimodal functions, ICDs etc.
  # 7 = Value reserved for fixed transport functions (e.g. oil platform).
  # B = Specifies that the location is Border crossing.
  #
  def locode_attributes(row)
    row = [] if row.nil?
    locode_array = row.split(//)
    {
      port: locode_array[0] == "1",
      rail_terminal: locode_array[1] == "2",
      road_terminal: locode_array[2] == "3",
      airport: locode_array[3] == "4",
      postal_exchange_office: locode_array[4] == "5",
      inland_clearance_depot: locode_array[5] == "6",
      fixed_transport_functions: locode_array[6] == "7",
      border_crossing_function: locode_array[7].try(:upcase) == "B"
    }
  end

  def full_name(row)
    alternatives?(row[0]) ? name_attr_with_alternatives(row[3], row[4]) : name_attr(row[3], row[4])
  end

  def name_attr(full_name, alternative_full_names_without_diacritics)
    {
      full_name: full_name.strip,
      alternative_full_names_without_diacritics: alternative_full_names_without_diacritics.strip
    }
  end

  def alternatives?(changes)
    changes == "="
  end

  def name_attr_with_alternatives(full_name, alternative_full_names_without_diacritics)
    {
      full_name: full_name.split("=").last.strip,
      full_name_without_diacritics: alternative_full_names_without_diacritics.split("=").last.strip,
      alternative_full_names: full_name.split("=").first.strip,
      alternative_full_names_without_diacritics: alternative_full_names_without_diacritics.split("=").first.strip
    }
  end

  def latitude_info(row)
    return 0.0 if row.blank?

    latitude_col = row.split[0]
    CoordinatesConverter.dms_to_decimal(latitude_col.remove(latitude_col.last).to_i,
                                        latitude_col.last)
  end

  def longitude_info(row)
    return 0.0 if row.blank?

    longitude_col = row.split[1]
    CoordinatesConverter.dms_to_decimal(longitude_col.remove(longitude_col.last).to_i,
                                        longitude_col.last)
  end
end
