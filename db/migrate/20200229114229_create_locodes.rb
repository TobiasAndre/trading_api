class CreateLocodes < ActiveRecord::Migration[6.0]
  def change
    create_table :locodes do |t|
      t.string :change_marker
      t.references :country, foreign_key: true
      t.string :city_code
      t.string :full_name
      t.string :full_name_without_diacritics
      t.string :alternative_full_names
      t.string :alternative_full_names_without_diacritics
      t.string :subdivision
      t.boolean :port
      t.boolean :rail_terminal
      t.boolean :road_terminal
      t.boolean :airport
      t.boolean :postal_exchange_office
      t.boolean :inland_clearance_depot
      t.boolean :fixed_transport_functions
      t.boolean :border_crossing_function
      t.string :status
      t.date :date
      t.string :iata
      t.string :coordinates
      t.point :geo_coordinates
      t.string :remarks
      t.timestamps
    end
    add_index(:locodes, [:country_id, :city_code, :change_marker])
  end
end
