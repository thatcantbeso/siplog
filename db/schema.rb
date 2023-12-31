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

ActiveRecord::Schema[7.0].define(version: 2023_11_16_181122) do
  create_table "brewers", force: :cascade do |t|
    t.integer "owner_id"
    t.string "brand"
    t.string "name"
    t.string "material"
    t.string "geometry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coffees", force: :cascade do |t|
    t.integer "owner_id"
    t.string "species"
    t.string "varietal"
    t.string "process"
    t.integer "elevation"
    t.string "region"
    t.string "subregion"
    t.integer "roast_level"
    t.date "roast_date"
    t.integer "cup_score"
    t.string "tasting_notes"
    t.string "name"
    t.string "roaster"
    t.string "producer"
    t.boolean "favorite"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grinders", force: :cascade do |t|
    t.integer "owner_id"
    t.string "brand"
    t.string "name"
    t.string "power"
    t.string "burr_type"
    t.string "burr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "logs", force: :cascade do |t|
    t.integer "owner_id"
    t.integer "coffee_id"
    t.integer "grinder_id"
    t.integer "brewer_id"
    t.text "notes"
    t.string "filter_paper"
    t.integer "dosage"
    t.integer "water_temperature"
    t.string "water_type"
    t.string "photo"
    t.integer "grind_size"
    t.integer "bloom_time_seconds"
    t.integer "brew_time_seconds"
    t.integer "bloom_water"
    t.integer "total_water"
    t.datetime "date_time"
    t.integer "rating"
    t.boolean "favorite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
