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

ActiveRecord::Schema.define(version: 20151023181553) do

  create_table "posts", force: :cascade do |t|
    t.integer  "sub_id"
    t.integer  "author_id"
    t.string   "title"
    t.text     "content"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["author_id"], name: "index_posts_on_author_id"
  add_index "posts", ["sub_id"], name: "index_posts_on_sub_id"

  create_table "subs", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "mod_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subs", ["mod_id"], name: "index_subs_on_mod_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "session_token"
  end

  add_index "users", ["password_digest"], name: "index_users_on_password_digest"

end
