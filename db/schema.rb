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

ActiveRecord::Schema.define(version: 20141115232814) do

  create_table "inventories", force: true do |t|
    t.integer  "item_id",    null: false
    t.string   "item_type",  null: false
    t.integer  "player_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_battles", force: true do |t|
    t.integer  "battle_id",                              null: false
    t.integer  "player_id",                              null: false
    t.integer  "monster_id",                             null: false
    t.string   "status",         default: "in-progress", null: false
    t.integer  "monster_health",                         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.string   "title"
    t.integer  "exp",             default: 0, null: false
    t.integer  "hunts",           default: 0, null: false
    t.integer  "rubies",          default: 0, null: false
    t.integer  "level",           default: 0, null: false
    t.integer  "muscle",          default: 0, null: false
    t.integer  "intellect",       default: 0, null: false
    t.integer  "defense",         default: 0, null: false
    t.integer  "spending_points", default: 3, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slots", force: true do |t|
    t.integer  "item_id",    null: false
    t.string   "item_type",  null: false
    t.integer  "player_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
