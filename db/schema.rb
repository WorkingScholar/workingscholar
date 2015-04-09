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

ActiveRecord::Schema.define(version: 20150409014356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "student_id"
  end

  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true, using: :btree
  add_index "accounts", ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true, using: :btree
  add_index "accounts", ["student_id"], name: "index_accounts_on_student_id", using: :btree

  create_table "majors", force: :cascade do |t|
    t.string   "name"
    t.integer  "students_count", default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.integer  "students_count", default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "graduation_year"
    t.integer  "school_id"
    t.integer  "major_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "students", ["major_id"], name: "index_students_on_major_id", using: :btree
  add_index "students", ["school_id"], name: "index_students_on_school_id", using: :btree

  add_foreign_key "accounts", "students"
  add_foreign_key "students", "majors"
  add_foreign_key "students", "schools"
end
