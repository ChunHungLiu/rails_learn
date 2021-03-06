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

ActiveRecord::Schema.define(version: 20131229041156) do

  create_table "pages", force: true do |t|
    t.string   "title"
    t.string   "type"
    t.string   "author_name"
    t.string   "author_url"
    t.string   "provider_name"
    t.string   "provider_url"
    t.text     "description"
    t.string   "thumbnail_url"
    t.string   "thumbnail_width"
    t.string   "thumbnail_height"
    t.string   "html"
    t.string   "width"
    t.string   "height"
    t.string   "favicon_url"
    t.string   "content"
    t.string   "intro"
    t.text     "messenge"
    t.string   "page_tag"
    t.integer  "count_click",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fb_id",                  limit: 20
    t.string   "token"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
