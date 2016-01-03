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

ActiveRecord::Schema.define(version: 20160102201828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_sessions", force: :cascade do |t|
    t.string   "code"
    t.string   "title"
    t.integer  "created_by"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "status",     default: false
  end

  create_table "questions", force: :cascade do |t|
    t.text     "description"
    t.integer  "event_session_id"
    t.integer  "vote_count",       default: 0
    t.integer  "status",           default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "questions", ["event_session_id"], name: "index_questions_on_event_session_id", using: :btree

  add_foreign_key "questions", "event_sessions"
end
