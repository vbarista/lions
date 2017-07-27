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

ActiveRecord::Schema.define(version: 20170727051809) do

  create_table "confirmations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.integer "onoff"
    t.string "reason_for_off"
    t.string "guest1_company"
    t.string "guest1_name"
    t.string "guest1_position"
    t.string "guest2_company"
    t.string "guest2_name"
    t.string "guest2_position"
    t.string "guest3_company"
    t.string "guest3_name"
    t.string "guest3_position"
    t.string "guest4_company"
    t.string "guest4_name"
    t.string "guest4_position"
    t.string "guest5_company"
    t.string "guest5_name"
    t.string "guest5_position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.datetime "datetime"
    t.string "contents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin_flg"
    t.boolean "edit_flg"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
