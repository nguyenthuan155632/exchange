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

ActiveRecord::Schema.define(version: 20161215041420) do

  create_table "balances", force: :cascade do |t|
    t.float    "amount",     limit: 24
    t.integer  "shop_id",    limit: 4
    t.boolean  "jpy_btc",    limit: 1
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "btc_addresses", force: :cascade do |t|
    t.string   "address",    limit: 255
    t.integer  "user_id",    limit: 4
    t.integer  "shop_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "btc_addresses", ["shop_id"], name: "index_btc_addresses_on_shop_id", using: :btree
  add_index "btc_addresses", ["user_id"], name: "index_btc_addresses_on_user_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "message",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "kyc_papers", force: :cascade do |t|
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

  create_table "operators", force: :cascade do |t|
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "user_name",              limit: 255, default: "",    null: false
    t.boolean  "admin",                  limit: 1,   default: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "operators", ["reset_password_token"], name: "index_operators_on_reset_password_token", unique: true, using: :btree
  add_index "operators", ["user_name"], name: "index_operators_on_user_name", unique: true, using: :btree

  create_table "reservations", force: :cascade do |t|
    t.float    "amout",          limit: 24
    t.integer  "rate",           limit: 4
    t.boolean  "btc_jpy",        limit: 1
    t.integer  "status",         limit: 4,  default: 0
    t.integer  "user_id",        limit: 4
    t.integer  "shop_id",        limit: 4
    t.integer  "btc_address_id", limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string   "key",        limit: 255
    t.string   "value",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "address",     limit: 255
    t.string   "phone",       limit: 255
    t.float    "deposit",     limit: 24
    t.string   "lat",         limit: 255
    t.string   "long",        limit: 255
    t.integer  "operator_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.string   "user_name",              limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "btc_addresses", "shops"
  add_foreign_key "btc_addresses", "users"
end
