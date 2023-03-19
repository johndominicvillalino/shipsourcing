# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_03_19_040413) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "couriers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "logo_url"
  end

  create_table "prices", force: :cascade do |t|
    t.float "base_rate"
    t.bigint "service_destination_id", null: false
    t.string "scope_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_destination_id"], name: "index_prices_on_service_destination_id"
  end

  create_table "service_destinations", force: :cascade do |t|
    t.string "province"
    t.string "country"
    t.bigint "service_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "service_pickup_id"
    t.index ["service_id"], name: "index_service_destinations_on_service_id"
    t.index ["service_pickup_id"], name: "index_service_destinations_on_service_pickup_id"
  end

  create_table "service_pickups", force: :cascade do |t|
    t.string "province"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "service_id"
    t.string "scope"
    t.index ["service_id"], name: "index_service_pickups_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "courier_id"
    t.string "delivery_method"
    t.index ["courier_id"], name: "index_services_on_courier_id"
  end

  add_foreign_key "prices", "service_destinations"
  add_foreign_key "service_destinations", "service_pickups"
  add_foreign_key "service_destinations", "services"
  add_foreign_key "service_pickups", "services"
  add_foreign_key "services", "couriers"
end
