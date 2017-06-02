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

ActiveRecord::Schema.define(version: 20170602053108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bcc_addresses", force: :cascade do |t|
    t.integer  "email_id"
    t.integer  "email_address_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["email_address_id"], name: "index_bcc_addresses_on_email_address_id", using: :btree
    t.index ["email_id"], name: "index_bcc_addresses_on_email_id", using: :btree
  end

  create_table "cc_addresses", force: :cascade do |t|
    t.integer  "email_id"
    t.integer  "email_address_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["email_address_id"], name: "index_cc_addresses_on_email_address_id", using: :btree
    t.index ["email_id"], name: "index_cc_addresses_on_email_id", using: :btree
  end

  create_table "email_addresses", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emails", force: :cascade do |t|
    t.string   "subject"
    t.date     "date"
    t.string   "message_id"
    t.text     "decoded"
    t.text     "text_body"
    t.text     "html_body"
    t.text     "raw"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "from_addresses", force: :cascade do |t|
    t.integer  "email_id"
    t.integer  "email_address_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["email_address_id"], name: "index_from_addresses_on_email_address_id", using: :btree
    t.index ["email_id"], name: "index_from_addresses_on_email_id", using: :btree
  end

  create_table "to_addresses", force: :cascade do |t|
    t.integer  "email_id"
    t.integer  "email_address_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["email_address_id"], name: "index_to_addresses_on_email_address_id", using: :btree
    t.index ["email_id"], name: "index_to_addresses_on_email_id", using: :btree
  end

  create_table "tweets", force: :cascade do |t|
    t.text     "text"
    t.datetime "last_tweeted"
    t.integer  "tweet_counter"
    t.boolean  "active",        default: false, null: false
    t.integer  "user_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["user_id"], name: "index_tweets_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "volunteers", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "email"
    t.string   "phone"
    t.text     "focus",      default: [],              array: true
    t.text     "essay"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "writeups", force: :cascade do |t|
    t.string   "url"
    t.string   "caption"
    t.text     "description"
    t.date     "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "bcc_addresses", "email_addresses"
  add_foreign_key "bcc_addresses", "emails"
  add_foreign_key "cc_addresses", "email_addresses"
  add_foreign_key "cc_addresses", "emails"
  add_foreign_key "from_addresses", "email_addresses"
  add_foreign_key "from_addresses", "emails"
  add_foreign_key "to_addresses", "email_addresses"
  add_foreign_key "to_addresses", "emails"
  add_foreign_key "tweets", "users"
end
