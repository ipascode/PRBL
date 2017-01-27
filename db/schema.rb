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

ActiveRecord::Schema.define(version: 20170127091326) do

  create_table "bus_lines", force: :cascade do |t|
    t.string   "linename"
    t.float    "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bus_models", force: :cascade do |t|
    t.string   "brand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buses", force: :cascade do |t|
    t.integer  "BusModel_id"
    t.string   "plate_no"
    t.datetime "date_purchased"
    t.integer  "Repair_id"
    t.float    "odometer"
    t.integer  "BusLine_id"
    t.float    "cpk"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "bus_no"
    t.index ["BusLine_id"], name: "index_buses_on_BusLine_id"
    t.index ["BusModel_id"], name: "index_buses_on_BusModel_id"
    t.index ["Repair_id"], name: "index_buses_on_Repair_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string   "lastname"
    t.string   "firstname"
    t.string   "middlename"
    t.integer  "Repair_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Repair_id"], name: "index_drivers_on_Repair_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.datetime "timestarted"
    t.datetime "timefinished"
    t.float    "duration"
    t.string   "jobparticular"
    t.integer  "mechanic_id"
    t.boolean  "done"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "repair_id"
    t.index ["mechanic_id"], name: "index_jobs_on_mechanic_id"
  end

  create_table "mechanics", force: :cascade do |t|
    t.string   "lastname"
    t.string   "firstname"
    t.string   "middlename"
    t.string   "type"
    t.string   "skills"
    t.integer  "shift"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repairs", force: :cascade do |t|
    t.datetime "datestarted"
    t.datetime "datefinished"
    t.string   "repairtype"
    t.integer  "Driver_id"
    t.integer  "Bus_id"
    t.string   "location"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["Bus_id"], name: "index_repairs_on_Bus_id"
    t.index ["Driver_id"], name: "index_repairs_on_Driver_id"
  end

end
