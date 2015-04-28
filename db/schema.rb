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

ActiveRecord::Schema.define(version: 20150428172232) do

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
    t.integer  "employer_id"
    t.integer  "student_id"
    t.string   "username"
    t.string   "name"
  end

  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true, using: :btree
  add_index "accounts", ["employer_id"], name: "index_accounts_on_employer_id", using: :btree
  add_index "accounts", ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true, using: :btree
  add_index "accounts", ["student_id"], name: "index_accounts_on_student_id", using: :btree

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.integer  "student_count", default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "employers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "majors", force: :cascade do |t|
    t.string   "name"
    t.integer  "students_count", default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "posting_applications", force: :cascade do |t|
    t.integer  "posting_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "posting_applications", ["posting_id"], name: "index_posting_applications_on_posting_id", using: :btree
  add_index "posting_applications", ["student_id"], name: "index_posting_applications_on_student_id", using: :btree

  create_table "postings", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "employer_id"
    t.integer  "duration"
    t.string   "compensation"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "view_count",   default: 0
  end

  add_index "postings", ["employer_id"], name: "index_postings_on_employer_id", using: :btree

  create_table "resume_entries", force: :cascade do |t|
    t.integer  "student_id"
    t.string   "job_title"
    t.string   "employer_name"
    t.integer  "employer_id"
    t.string   "start_date"
    t.string   "end_date"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "resume_entries", ["employer_id"], name: "index_resume_entries_on_employer_id", using: :btree
  add_index "resume_entries", ["student_id"], name: "index_resume_entries_on_student_id", using: :btree

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.integer  "students_count", default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "students", force: :cascade do |t|
    t.date     "graduation_year"
    t.integer  "school_id"
    t.integer  "major_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "students", ["major_id"], name: "index_students_on_major_id", using: :btree
  add_index "students", ["school_id"], name: "index_students_on_school_id", using: :btree

  add_foreign_key "accounts", "employers"
  add_foreign_key "accounts", "students"
  add_foreign_key "posting_applications", "postings"
  add_foreign_key "posting_applications", "students"
  add_foreign_key "postings", "employers"
  add_foreign_key "resume_entries", "employers"
  add_foreign_key "resume_entries", "students"
  add_foreign_key "students", "majors"
  add_foreign_key "students", "schools"
end
