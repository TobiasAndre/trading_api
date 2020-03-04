# frozen_string_literal: true

class Locode < ApplicationRecord
  belongs_to :country

  scope :filter_by_place, lambda { |place|
                            joins(:country).where("full_name like ? or countries.name like ? or countries.code like ?",
                                                  "#{place}%", "#{place}%", "#{place}%")
                          }
  scope :filter_by_address, lambda { |address|
                              where("full_name like ? or full_name_without_diacritics like ?",
                                    "#{address}%", "#{address}%")
                            }
end
