# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_02_10_232310) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "completed_trips", force: :cascade do |t|
    t.time "actual_pickup_time"
    t.time "departure_time"
    t.time "actual_dropoff_time"
    t.string "signature_type"
    t.bigint "scheduledtrip_id"
    t.bigint "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scheduledtrip_id"], name: "index_completed_trips_on_scheduledtrip_id"
    t.index ["vehicle_id"], name: "index_completed_trips_on_vehicle_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "license_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scheduled_trips", force: :cascade do |t|
    t.time "scheduled_pickup"
    t.bigint "trip_id"
    t.bigint "driver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_scheduled_trips_on_driver_id"
    t.index ["trip_id"], name: "index_scheduled_trips_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "provider"
    t.string "trip_number"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "pickup_address"
    t.string "pickup_city"
    t.string "pickup_zip"
    t.string "delivery_address"
    t.string "delivery_city"
    t.string "appointment_date"
    t.string "appointment_time"
    t.string "reason_code"
    t.string "provider_status"
    t.string "vehicle_type"
    t.string "trip_type"
    t.integer "additional_passengers"
    t.integer "additional_appointments"
    t.float "mileage"
    t.float "cost"
    t.text "special_needs"
    t.text "instructions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "vin"
    t.string "vehicle_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
