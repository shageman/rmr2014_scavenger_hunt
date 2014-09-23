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

ActiveRecord::Schema.define(version: 20140923203039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "clues", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "clue_type"
  end

  create_table "measures", force: true do |t|
    t.integer "ts"
    t.integer "gen1"
    t.integer "gen2"
    t.string  "data1",                         limit: nil
    t.string  "data2",                         limit: nil
    t.integer "total"
    t.integer "air_conditioner"
    t.integer "kitchen_dining_receptacles"
    t.integer "kitchen_fridge"
    t.integer "kitchen_app1"
    t.integer "kitchen_app2"
    t.integer "kitchen_disposal"
    t.integer "kitchen_dischwasher"
    t.integer "kitchen_floor_heating"
    t.integer "kitchen_lights"
    t.integer "kitchen_microwave"
    t.integer "first_floor_receptacles"
    t.integer "washroom_dryer"
    t.integer "hottub"
    t.integer "basement_plugs_light"
    t.integer "furnace"
    t.integer "basement_lights_office_plugs"
    t.integer "washroom_washer_fridge_lights"
  end

  add_index "measures", ["ts"], name: "measures_ts_key", unique: true, using: :btree

  create_table "teams", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "clue_order"
    t.integer  "current_clue_index"
  end

end
