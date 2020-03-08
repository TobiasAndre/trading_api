FactoryBot.define do
  factory :locode do
    change_marker { "" }
    country
    city_code { FFaker::Address.city_prefix }
    full_name { FFaker::Address.city }
    full_name_without_diacritics { "" }
    alternative_full_names { "" }
    alternative_full_names_without_diacritics { "" }
    subdivision { "B" }
    port { FFaker::Boolean.random }
    rail_terminal { FFaker::Boolean.random }
    road_terminal { FFaker::Boolean.random }
    airport { FFaker::Boolean.random }
    postal_exchange_office { FFaker::Boolean.random }
    inland_clearance_depot { FFaker::Boolean.random }
    fixed_transport_functions { FFaker::Boolean.random }
    border_crossing_function { FFaker::Boolean.random }
    status { "AI" }
    date { "" }
    iata { "" }
    coordinates { "4230N 00131E" }
    geo_coordinates { ActiveRecord::Point.new("40.383333333333326", "-74.25000000000001") }
    remarks { "" }
  end
end