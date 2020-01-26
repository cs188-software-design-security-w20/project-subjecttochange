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

ActiveRecord::Schema.define(version: 2020_01_26_044429) do

  create_table "appointments", force: :cascade do |t|
    t.string "patient_email"
    t.string "practice_email"
    t.datetime "appt_start"
    t.integer "duration"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "medical_records", force: :cascade do |t|
    t.string "patient_email"
    t.string "practice_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "to_email"
    t.string "from_email"
    t.string "message_title"
    t.string "message_body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "middle_initial", limit: 1
    t.string "gender", limit: 1
    t.integer "phone_number"
    t.string "street_address"
    t.string "city"
    t.string "state", limit: 2
    t.integer "zipcode", limit: 5
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "practices", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "middle_initial", limit: 1
    t.string "med_school"
    t.integer "phone_number"
    t.string "street_address"
    t.string "city"
    t.string "state", limit: 2
    t.integer "zipcode", limit: 5
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
