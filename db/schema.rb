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

ActiveRecord::Schema.define(version: 20150720061534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cheeses", force: :cascade do |t|
    t.string   "name"
    t.string   "family",             null: false
    t.string   "origin"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "milk"
    t.integer  "farm_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "age"
  end

  add_index "cheeses", ["farm_id"], name: "index_cheeses_on_farm_id", using: :btree

  create_table "farms", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "bio"
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "name_of_cheese"
    t.text     "commentary"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "cheese_id"
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "wheels"
    t.integer  "wheel"
    t.string   "title"
  end

  add_index "reviews", ["cheese_id"], name: "index_reviews_on_cheese_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wheels", force: :cascade do |t|
    t.boolean  "like"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "rating"
    t.integer  "user_id"
  end

  add_index "wheels", ["user_id"], name: "index_wheels_on_user_id", using: :btree

  add_foreign_key "cheeses", "farms"
  add_foreign_key "reviews", "cheeses"
  add_foreign_key "reviews", "users"
  add_foreign_key "wheels", "users"
end
