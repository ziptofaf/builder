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

ActiveRecord::Schema.define(version: 20160506190514) do

  create_table "computer_cases", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.decimal  "dollar_price", precision: 9, scale: 2
    t.decimal  "euro_price",   precision: 9, scale: 2
    t.integer  "size"
    t.integer  "performance"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
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
  end

  create_table "prebuilts", force: :cascade do |t|
    t.decimal  "price",       precision: 8, scale: 2
    t.string   "partlist"
    t.decimal  "performance", precision: 8, scale: 2
    t.integer  "type_build"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "size"
  end

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
  end

  add_index "processors", ["platform_id"], name: "index_processors_on_platform_id"

end
