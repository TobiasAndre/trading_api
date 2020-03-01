# frozen_string_literal: true

class LocodeSerializer < ActiveModel::Serializer
  attributes :id, :change_marker, :city_code, :full_name, :full_name_without_diacritics, :alternative_full_names,
             :alternative_full_names_without_diacritics, :subdivision, :status, :coordinates, :remarks,
             :port, :rail_terminal, :road_terminal, :airport, :postal_exchange_office, :inland_clearance_depot,
             :fixed_transport_functions, :border_crossing_function
  belongs_to :country
end
