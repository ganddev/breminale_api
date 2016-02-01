# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160115144014) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breminale_dates", force: :cascade do |t|
    t.datetime "my_date"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "breminale_dates", ["user_id"], name: "index_breminale_dates_on_user_id", using: :btree

  create_table "emp_data", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "desc"
    t.string   "image_url"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "user_id"
    t.integer  "location_id"
    t.integer  "breminale_date_id"
  end

  add_index "events", ["breminale_date_id"], name: "index_events_on_breminale_date_id", using: :btree

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.boolean  "deleted"
    t.integer  "user_id"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "locations", ["user_id"], name: "index_locations_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "auth_token"
    t.string   "password_digest"
  end

  add_foreign_key "breminale_dates", "users"
  add_foreign_key "events", "breminale_dates"
  add_foreign_key "events", "locations"
  add_foreign_key "events", "users"
  add_foreign_key "locations", "users"
end
