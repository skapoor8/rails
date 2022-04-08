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

ActiveRecord::Schema.define(version: 20160419044716) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departments", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "department_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "employees", ["department_id"], name: "index_employees_on_department_id", using: :btree
  add_index "employees", ["user_id"], name: "index_employees_on_user_id", using: :btree

  create_table "incident_question_answers", force: :cascade do |t|
    t.integer  "incident_question_id"
    t.string   "answer",               null: false
    t.boolean  "default_answer",       null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "incident_question_answers", ["incident_question_id"], name: "index_incident_question_answers_on_incident_question_id", using: :btree

  create_table "incident_questions", force: :cascade do |t|
    t.integer  "incident_type_id"
    t.string   "question",         null: false
    t.integer  "question_form",    null: false
    t.integer  "min_val"
    t.integer  "max_val"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "incident_questions", ["incident_type_id"], name: "index_incident_questions_on_incident_type_id", using: :btree

  create_table "incident_responses", force: :cascade do |t|
    t.integer  "incident_id"
    t.integer  "report_custom_comment_id"
    t.integer  "report_comment_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "incident_responses", ["incident_id"], name: "index_incident_responses_on_incident_id", using: :btree
  add_index "incident_responses", ["report_comment_id"], name: "index_incident_responses_on_report_comment_id", using: :btree
  add_index "incident_responses", ["report_custom_comment_id"], name: "index_incident_responses_on_report_custom_comment_id", using: :btree

  create_table "incident_types", force: :cascade do |t|
    t.string   "name",             null: false
    t.integer  "default_severity"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "incidents", force: :cascade do |t|
    t.string   "location",         null: false
    t.datetime "report_date"
    t.datetime "start_date",       null: false
    t.datetime "checkout_date"
    t.datetime "resolve_date"
    t.integer  "incident_type_id"
    t.integer  "severity",         null: false
    t.integer  "bump_count"
    t.string   "name",             null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "description"
    t.integer  "user_id"
  end

  add_index "incidents", ["incident_type_id"], name: "index_incidents_on_incident_type_id", using: :btree
  add_index "incidents", ["user_id"], name: "index_incidents_on_user_id", using: :btree

  create_table "report_comments", force: :cascade do |t|
    t.integer  "incident_question_answer_id"
    t.integer  "incident_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "report_comments", ["incident_id"], name: "index_report_comments_on_incident_id", using: :btree
  add_index "report_comments", ["incident_question_answer_id"], name: "index_report_comments_on_incident_question_answer_id", using: :btree

  create_table "report_custom_comments", force: :cascade do |t|
    t.integer  "incident_id"
    t.integer  "incident_question_id"
    t.text     "answer"
    t.integer  "range_value"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "report_custom_comments", ["incident_id"], name: "index_report_custom_comments_on_incident_id", using: :btree
  add_index "report_custom_comments", ["incident_question_id"], name: "index_report_custom_comments_on_incident_question_id", using: :btree

  create_table "responses", force: :cascade do |t|
    t.integer  "incident_id"
    t.integer  "user_id"
    t.text     "custom_comment", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "responses", ["incident_id"], name: "index_responses_on_incident_id", using: :btree
  add_index "responses", ["user_id"], name: "index_responses_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email", "phone_number"], name: "index_users_on_email_and_phone_number", unique: true, using: :btree

  add_foreign_key "employees", "departments"
  add_foreign_key "employees", "users"
  add_foreign_key "incident_question_answers", "incident_questions"
  add_foreign_key "incident_questions", "incident_types"
  add_foreign_key "incident_responses", "incidents"
  add_foreign_key "incident_responses", "report_comments"
  add_foreign_key "incident_responses", "report_custom_comments"
  add_foreign_key "incidents", "incident_types"
  add_foreign_key "report_comments", "incident_question_answers"
  add_foreign_key "report_comments", "incidents"
  add_foreign_key "report_custom_comments", "incident_questions"
  add_foreign_key "report_custom_comments", "incidents"
  add_foreign_key "responses", "incidents"
  add_foreign_key "responses", "users"
end
