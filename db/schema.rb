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

ActiveRecord::Schema.define(version: 20160529062525) do

  create_table "computer_cases", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.decimal  "dollar_price", precision: 9, scale: 2
    t.decimal  "euro_price",   precision: 9, scale: 2
    t.integer  "size"
    t.integer  "performance"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "picture"
  end

  create_table "drives", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.decimal  "dollar_price", precision: 9, scale: 2
    t.decimal  "euro_price",   precision: 9, scale: 2
    t.integer  "capacity"
    t.integer  "performance"
    t.integer  "disk_type"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "picture"
  end

  create_table "graphics", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.integer  "size"
    t.decimal  "dollar_price", precision: 9, scale: 2
    t.decimal  "euro_price",   precision: 9, scale: 2
    t.decimal  "cpu_average",  precision: 9, scale: 2
    t.decimal  "performance",  precision: 9, scale: 2
    t.integer  "power"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "picture"
  end

  create_table "memories", force: :cascade do |t|
    t.integer  "ram_type"
    t.string   "name"
    t.string   "link"
    t.decimal  "dollar_price", precision: 9, scale: 2
    t.decimal  "euro_price",   precision: 9, scale: 2
    t.integer  "sticks"
    t.integer  "capacity"
    t.integer  "score"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "picture"
  end

  create_table "motherboards", force: :cascade do |t|
    t.string   "name"
    t.integer  "platform_id"
    t.string   "link"
    t.integer  "size"
    t.decimal  "OC",           precision: 5, scale: 2
    t.integer  "ram_slots"
    t.decimal  "dollar_price", precision: 9, scale: 2
    t.decimal  "euro_price",   precision: 9, scale: 2
    t.integer  "score"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "memory"
    t.string   "picture"
  end

  add_index "motherboards", ["platform_id"], name: "index_motherboards_on_platform_id"

  create_table "platforms", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "power_supplies", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.decimal  "dollar_price", precision: 9, scale: 2
    t.decimal  "euro_price",   precision: 9, scale: 2
    t.integer  "power"
    t.integer  "performance"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "picture"
  end

  create_table "prebuilts", force: :cascade do |t|
    t.decimal  "price",            precision: 8, scale: 2
    t.decimal  "performance",      precision: 8, scale: 2
    t.integer  "type_build"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "size"
    t.integer  "currency"
    t.decimal  "real_price",       precision: 5, scale: 2
    t.integer  "processor_id"
    t.integer  "graphic_id"
    t.integer  "computer_case_id"
    t.integer  "drive_id"
    t.integer  "motherboard_id"
    t.integer  "power_supply_id"
    t.integer  "memory_id"
  end

  add_index "prebuilts", ["computer_case_id"], name: "index_prebuilts_on_computer_case_id"
  add_index "prebuilts", ["drive_id"], name: "index_prebuilts_on_drive_id"
  add_index "prebuilts", ["graphic_id"], name: "index_prebuilts_on_graphic_id"
  add_index "prebuilts", ["memory_id"], name: "index_prebuilts_on_memory_id"
  add_index "prebuilts", ["motherboard_id"], name: "index_prebuilts_on_motherboard_id"
  add_index "prebuilts", ["power_supply_id"], name: "index_prebuilts_on_power_supply_id"
  add_index "prebuilts", ["processor_id"], name: "index_prebuilts_on_processor_id"

  create_table "processors", force: :cascade do |t|
    t.string   "name"
    t.decimal  "single",       precision: 8, scale: 2
    t.decimal  "multi",        precision: 8, scale: 2
    t.decimal  "average",      precision: 8, scale: 2
    t.integer  "platform_id"
    t.integer  "iGPU"
    t.decimal  "OC",           precision: 5, scale: 2
    t.string   "link"
    t.integer  "power"
    t.decimal  "dollar_price", precision: 9, scale: 2
    t.decimal  "euro_price",   precision: 9, scale: 2
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "picture"
  end

  add_index "processors", ["platform_id"], name: "index_processors_on_platform_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "admin"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
