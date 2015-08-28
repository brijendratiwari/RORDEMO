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

ActiveRecord::Schema.define(version: 20150822104320) do

  create_table "comments", force: :cascade do |t|
    t.text     "comments",   limit: 65535
    t.integer  "task_id",    limit: 4
    t.integer  "users_id",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "project_user_relations", force: :cascade do |t|
    t.integer  "projects_id", limit: 4
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.text     "description",        limit: 65535
    t.date     "start_date"
    t.date     "estimeted_end_date"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "users_id",           limit: 4
  end

  create_table "settings", force: :cascade do |t|
    t.string   "hostaddress", limit: 255
    t.integer  "port",        limit: 4
    t.string   "user_name",   limit: 255
    t.string   "password",    limit: 255
    t.string   "enable_ssl",  limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "protocol",    limit: 255
    t.integer  "user_id",     limit: 4
  end

  create_table "settingsmtps", force: :cascade do |t|
    t.string   "hostaddress", limit: 255
    t.string   "post",        limit: 255
    t.string   "user_name",   limit: 255
    t.string   "password",    limit: 255
    t.string   "enable_ssl",  limit: 255
    t.string   "protocol",    limit: 255
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "task_project_user_relations", force: :cascade do |t|
    t.integer  "task_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "descriptions", limit: 65535
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "users_id",     limit: 4
    t.integer  "project_id",   limit: 4
    t.integer  "status",       limit: 4,     default: 0
    t.integer  "completed_by", limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "firstname",              limit: 255
    t.string   "lastname",               limit: 255
    t.date     "dob"
    t.string   "position",               limit: 255
    t.string   "contact",                limit: 255
    t.text     "address",                limit: 65535
    t.string   "avatar",                 limit: 255
    t.string   "accessLevel",            limit: 255
    t.string   "skills",                 limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
