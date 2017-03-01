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

ActiveRecord::Schema.define(version: 20170301033707) do

  create_table "bus_lines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "linename",              null: false
    t.float    "distance",   limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "bus_models", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "brand",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "bus_no",                                       null: false
    t.integer  "bus_model_id"
    t.string   "plate_no"
    t.datetime "date_purchased"
    t.float    "odometer",            limit: 24, default: 0.0
    t.integer  "bus_line_id"
    t.float    "cpk",                 limit: 24
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "status"
    t.index ["bus_line_id"], name: "index_buses_on_bus_line_id", using: :btree
    t.index ["bus_model_id"], name: "index_buses_on_bus_model_id", using: :btree
  end

  create_table "drivers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "lastname",            null: false
    t.string   "firstname"
    t.string   "middlename"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "job_parts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "part_id"
    t.integer  "quantity"
    t.float    "cost",       limit: 24
    t.integer  "job_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["job_id"], name: "index_job_parts_on_job_id", using: :btree
    t.index ["part_id"], name: "index_job_parts_on_part_id", using: :btree
  end

  create_table "jobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "timestarted"
    t.datetime "timefinished"
    t.float    "duration",      limit: 24
    t.string   "jobparticular",            null: false
    t.integer  "mechanic_id"
    t.integer  "repair_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "status"
    t.index ["mechanic_id"], name: "index_jobs_on_mechanic_id", using: :btree
    t.index ["repair_id"], name: "index_jobs_on_repair_id", using: :btree
  end

  create_table "mechanics", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "lastname",            null: false
    t.string   "firstname"
    t.string   "middlename"
    t.string   "position"
    t.string   "skills"
    t.integer  "shift"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "parts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "partname",                   null: false
    t.string   "part_number"
    t.string   "unit"
    t.integer  "bus_model_id"
    t.integer  "index_number"
    t.string   "price",        default: "0"
    t.integer  "lifespan"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.datetime "last_used"
    t.index ["bus_model_id"], name: "index_parts_on_bus_model_id", using: :btree
  end

  create_table "repairs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "datestarted"
    t.datetime "datefinished"
    t.string   "repairtype"
    t.string   "location"
    t.integer  "jobcard_num"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "driver_id"
    t.integer  "bus_id"
    t.boolean  "done",         default: false
    t.index ["bus_id"], name: "index_repairs_on_bus_id", using: :btree
    t.index ["driver_id"], name: "index_repairs_on_driver_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

  add_foreign_key "buses", "bus_lines"
  add_foreign_key "buses", "bus_models"
  add_foreign_key "job_parts", "jobs"
  add_foreign_key "job_parts", "parts"
  add_foreign_key "jobs", "mechanics"
  add_foreign_key "jobs", "repairs"
  add_foreign_key "parts", "bus_models"
  add_foreign_key "repairs", "buses"
  add_foreign_key "repairs", "drivers"
end
