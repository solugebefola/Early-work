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

ActiveRecord::Schema.define(version: 20151026213332) do

  create_table "goal_comments", force: :cascade do |t|
    t.integer  "goal_id",      null: false
    t.integer  "commenter_id", null: false
    t.text     "body",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "goal_comments", ["commenter_id"], name: "index_goal_comments_on_commenter_id"
  add_index "goal_comments", ["goal_id"], name: "index_goal_comments_on_goal_id"

  create_table "goals", force: :cascade do |t|
    t.string   "title",                         null: false
    t.string   "exposure",   default: "public"
    t.integer  "user_id",                       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "completed",  default: false
  end

  add_index "goals", ["user_id"], name: "index_goals_on_user_id"

  create_table "user_comments", force: :cascade do |t|
    t.integer  "user_id",      null: false
    t.integer  "commenter_id", null: false
    t.text     "body",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_comments", ["commenter_id"], name: "index_user_comments_on_commenter_id"
  add_index "user_comments", ["user_id"], name: "index_user_comments_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["password_digest"], name: "index_users_on_password_digest"
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end