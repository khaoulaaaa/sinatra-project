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

ActiveRecord::Schema.define(version: 20170313100104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "databases", force: :cascade do |t|
    t.string  "db_id"
    t.string  "db_type"
    t.integer "N_tables"
  end

  create_table "dependencies", force: :cascade do |t|
    t.string "file_name"
    t.string "file_type"
    t.string "service_name"
  end

  create_table "idrelations", force: :cascade do |t|
    t.string "ip_address"
    t.string "db_id"
  end

  create_table "instances", force: :cascade do |t|
    t.string  "ip_address"
    t.integer "N_services"
  end

  create_table "sdrelations", force: :cascade do |t|
    t.string "db_id"
    t.string "service_name"
  end

  create_table "services", force: :cascade do |t|
    t.string "process_id"
    t.string "service_name"
    t.string "language"
    t.string "status"
    t.date   "last_update"
  end

  create_table "sirelations", force: :cascade do |t|
    t.string "ip_address"
    t.string "service_name"
  end

  create_table "ssrelations", force: :cascade do |t|
    t.string "sender_s"
    t.string "receiver_s"
    t.string "protocol"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "mail"
    t.string   "password"
    t.string   "encrypted_password"
    t.string   "phone"
    t.string   "address"
    t.string   "locale"
    t.string   "status"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
