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

ActiveRecord::Schema.define(version: 20150901124817) do

  create_table "groups", force: :cascade do |t|
    t.string   "group_name"
    t.integer  "group_max"
    t.string   "group_region"
    t.string   "group_interest"
    t.text     "group_content"
    t.string   "group_founder"
    t.integer  "group_like"
    t.string   "group_member"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "replies", force: :cascade do |t|
    t.integer  "group_id"
    t.string   "reply_username"
    t.string   "reply_content"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
