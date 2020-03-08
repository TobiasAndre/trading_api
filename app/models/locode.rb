# frozen_string_literal: true

class Locode < ApplicationRecord
  belongs_to :country

  scope :filter_by_place, lambda { |place|
                            joins(:country).where("full_name like ? or countries.name like ? or countries.code like ?",
                                                  "#{place}%", "#{place}%", "#{place}%")
                          }
  scope :filter_by_address, lambda { |coordinates|
                              where("(point(#{coordinates[:lat]}, #{coordinates[:lon]})"\
                                    " <@> geo_coordinates) < 20 ")
                            }
end
