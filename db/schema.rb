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

ActiveRecord::Schema.define(version: 20161209031254) do

  create_table "contacts", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "message",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "exchange_jpy_btcs", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.float    "jpy_amout",  limit: 24
    t.float    "btc_amount", limit: 24
    t.integer  "status",     limit: 4,  default: 0
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "kyc_papers", force: :cascade do |t|
    t.string   "country",            limit: 255
    t.string   "first_name_chinese", limit: 255
    t.string   "last_name_chinese",  limit: 255
    t.string   "first_name_roman",   limit: 255
    t.string   "last_name_roman",    limit: 255
    t.date     "dob"
    t.string   "address",            limit: 255
    t.string   "city",               limit: 255
    t.string   "region",             limit: 255
    t.string   "postal_code",        limit: 255
    t.string   "phone",              limit: 255
    t.string   "passport_your_self", limit: 255
    t.string   "passport",           limit: 255
    t.string   "address_front",      limit: 255
    t.string   "address_after",      limit: 255
    t.string   "driver_your_self",   limit: 255
    t.string   "driver_front",       limit: 255
    t.string   "driver_after",       limit: 255
    t.string   "utility_bill",       limit: 255
    t.integer  "status",             limit: 4,   default: 0
    t.integer  "user_id",            limit: 4
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.float    "amout",      limit: 24
    t.string   "place",      limit: 255
    t.integer  "rate",       limit: 4
    t.boolean  "type",       limit: 1
    t.integer  "status",     limit: 4,   default: 0
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "address",    limit: 255
    t.string   "setting",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.boolean  "operator",               limit: 1,   default: false
    t.string   "user_name",              limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end