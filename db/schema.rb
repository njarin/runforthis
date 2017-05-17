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

ActiveRecord::Schema.define(version: 20170517225805) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "congress_members", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "state",      null: false
    t.integer  "district"
    t.string   "website"
    t.string   "end",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
  end

  create_table "resources", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resources_state_districts", force: :cascade do |t|
    t.integer "resource_id"
    t.integer "state_district_id"
  end

  create_table "state_districts", force: :cascade do |t|
    t.string   "state"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "state_legislators", force: :cascade do |t|
    t.string   "full_name"
    t.string   "title"
    t.string   "party"
    t.string   "website"
    t.string   "term_end"
    t.integer  "state_district_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

end
