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

ActiveRecord::Schema.define(version: 20160922165835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer  "task_id"
    t.integer  "grade_id"
    t.boolean  "completed"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "source_code"
  end

  add_index "activities", ["grade_id"], name: "index_activities_on_grade_id", using: :btree
  add_index "activities", ["task_id"], name: "index_activities_on_task_id", using: :btree

  create_table "contents", force: :cascade do |t|
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "track_id"
  end

  add_index "contents", ["track_id"], name: "index_contents_on_track_id", using: :btree

  create_table "grades", force: :cascade do |t|
    t.integer  "track_id"
    t.boolean  "finished"
    t.datetime "finished_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "grades", ["track_id"], name: "index_grades_on_track_id", using: :btree
  add_index "grades", ["user_id"], name: "index_grades_on_user_id", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.text     "snippet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "track_id"
    t.integer  "category"
  end

  add_index "tasks", ["track_id"], name: "index_tasks_on_track_id", using: :btree

  create_table "tracks", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "language"
    t.integer  "idiom"
  end

  create_table "tracks_users", id: false, force: :cascade do |t|
    t.integer "user_id",  null: false
    t.integer "track_id", null: false
  end

  add_index "tracks_users", ["track_id"], name: "index_tracks_users_on_track_id", using: :btree
  add_index "tracks_users", ["user_id"], name: "index_tracks_users_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "fullname"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "activities", "grades"
  add_foreign_key "activities", "tasks"
  add_foreign_key "contents", "tracks"
  add_foreign_key "grades", "tracks"
  add_foreign_key "grades", "users"
  add_foreign_key "tasks", "tracks"
end
