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

ActiveRecord::Schema.define(version: 20170210181331) do

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
    t.float    "odometer"
    t.integer  "BusLine_id"
    t.float    "cpk"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "bus_no"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["BusLine_id"], name: "index_buses_on_BusLine_id"
    t.index ["BusModel_id"], name: "index_buses_on_BusModel_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string   "lastname"
    t.string   "firstname"
    t.string   "middlename"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "job_parts", force: :cascade do |t|
    t.integer  "part_id"
    t.integer  "quantity"
    t.float    "cost"
    t.integer  "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_job_parts_on_job_id"
    t.index ["part_id"], name: "index_job_parts_on_part_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.datetime "timestarted"
    t.datetime "timefinished"
    t.float    "duration"
    t.string   "jobparticular"
    t.integer  "mechanic_id"
    t.boolean  "done"
    t.integer  "repair_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["mechanic_id"], name: "index_jobs_on_mechanic_id"
    t.index ["repair_id"], name: "index_jobs_on_repair_id"
  end

  create_table "mechanics", force: :cascade do |t|
    t.string   "lastname"
    t.string   "firstname"
    t.string   "middlename"
    t.string   "type"
    t.string   "skills"
    t.integer  "shift"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "parts", force: :cascade do |t|
    t.string   "partname"
    t.string   "part_number"
    t.integer  "BusModel_id"
    t.integer  "index_number"
    t.float    "price"
    t.integer  "lifespan"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "unit"
    t.index ["BusModel_id"], name: "index_parts_on_BusModel_id"
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
    t.integer  "jobcard_num"
    t.index ["Bus_id"], name: "index_repairs_on_Bus_id"
    t.index ["Driver_id"], name: "index_repairs_on_Driver_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "username"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "position"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
