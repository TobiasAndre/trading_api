# frozen_string_literal: true

class LocodeSerializer < ActiveModel::Serializer
  attributes :id, :change_marker, :city_code, :full_name, :full_name_without_diacritics, :alternative_full_names,
             :alternative_full_names_without_diacritics, :subdivision, :status, :coordinates, :remarks,
             :port, :rail_terminal, :road_terminal, :airport, :postal_exchange_office, :inland_clearance_depot,
             :fixed_transport_functions, :border_crossing_function, :geo_coordinates, :map_url
  belongs_to :country

  def map_url
    map_url = Rails.application.credentials[:location_map_url]
    "#{map_url}#{object.geo_coordinates.x},#{object.geo_coordinates.y},16z"
  end
end
