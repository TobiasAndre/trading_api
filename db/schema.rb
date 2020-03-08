# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_29_114229) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "locodes", force: :cascade do |t|
    t.string "change_marker"
    t.bigint "country_id"
    t.string "city_code"
    t.string "full_name"
    t.string "full_name_without_diacritics"
    t.string "alternative_full_names"
    t.string "alternative_full_names_without_diacritics"
    t.string "subdivision"
    t.boolean "port"
    t.boolean "rail_terminal"
    t.boolean "road_terminal"
    t.boolean "airport"
    t.boolean "postal_exchange_office"
    t.boolean "inland_clearance_depot"
    t.boolean "fixed_transport_functions"
    t.boolean "border_crossing_function"
    t.string "status"
    t.date "date"
    t.string "iata"
    t.string "coordinates"
    t.point "geo_coordinates"
    t.string "remarks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id", "city_code", "change_marker"], name: "index_locodes_on_country_id_and_city_code_and_change_marker"
    t.index ["country_id"], name: "index_locodes_on_country_id"
  end

  add_foreign_key "locodes", "countries"
end
