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

ActiveRecord::Schema.define(version: 20160320160430) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clothing_selections", force: :cascade do |t|
    t.integer  "quantity",     limit: 4
    t.integer  "person_id",    limit: 4
    t.integer  "garment_id",   limit: 4
    t.integer  "situation_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "creators", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "creators", ["email"], name: "index_creators_on_email", unique: true, using: :btree
  add_index "creators", ["reset_password_token"], name: "index_creators_on_reset_password_token", unique: true, using: :btree

  create_table "garment2s", force: :cascade do |t|
    t.string   "garments",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "garment_categories", force: :cascade do |t|
    t.integer  "garment_id",  limit: 4
    t.integer  "category_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "garments", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "packed",                 default: false
  end

  create_table "locations", force: :cascade do |t|
    t.integer  "trip_id",     limit: 4
    t.string   "destination", limit: 255
    t.string   "zipcode",     limit: 255
    t.datetime "start_day"
    t.datetime "end_day"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "models", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "models", ["email"], name: "index_models_on_email", unique: true, using: :btree
  add_index "models", ["reset_password_token"], name: "index_models_on_reset_password_token", unique: true, using: :btree

  create_table "outfit_categories", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "outfit_id",   limit: 4
    t.integer  "category_id", limit: 4
  end

  create_table "outfit_garments", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "outfit_id",  limit: 4
    t.integer  "garment_id", limit: 4
  end

  create_table "outfits", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",       limit: 255
    t.string   "gender",     limit: 255
  end

  create_table "people", force: :cascade do |t|
    t.integer  "trip_id",    limit: 4
    t.string   "name",       limit: 255
    t.string   "gender",     limit: 255
    t.integer  "age",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id", limit: 4
    t.string   "email",      limit: 255
  end

  create_table "situation_categories", force: :cascade do |t|
    t.integer  "category_id",  limit: 4
    t.integer  "situation_id", limit: 4
    t.boolean  "required"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "situations", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trip_situations", force: :cascade do |t|
    t.integer  "situation_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "trip_id",      limit: 4
  end

  create_table "trips", force: :cascade do |t|
    t.integer  "creator_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city",       limit: 255
    t.string   "state",      limit: 255
    t.datetime "start_date"
    t.datetime "end_date"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
