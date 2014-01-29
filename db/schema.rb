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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140129060748) do

  create_table "accounts", :force => true do |t|
    t.string   "account_number"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string   "desc"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "meeting_notes", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "meeting_id"
  end

  create_table "meetings", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.date     "meeting_date"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "member_payments", :force => true do |t|
    t.string   "name"
    t.float    "cost"
    t.boolean  "active"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "members", :force => true do |t|
    t.string   "name"
    t.date     "birthdate"
    t.boolean  "gender"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "members_swim_teams", :force => true do |t|
    t.integer  "swim_team_id"
    t.integer  "member_id"
    t.integer  "payment_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "membershippayments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "member_payment_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "payment_id"
  end

  create_table "payments", :force => true do |t|
    t.float    "amount"
    t.string   "stripe_id"
    t.boolean  "paid_by_check"
    t.integer  "user_id"
    t.integer  "account_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "user_description"
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "lifeguard",           :default => false
    t.boolean  "board",               :default => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "staticpages", :force => true do |t|
    t.string   "page_name"
    t.string   "page_title"
    t.text     "page_body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "page_url"
  end

  create_table "swim_teams", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "start_age"
    t.integer  "end_age"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "num_allowed_participants"
    t.float    "price_per_participant"
    t.boolean  "active"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.time     "start_time"
    t.time     "end_time"
    t.boolean  "mon"
    t.boolean  "tues"
    t.boolean  "wed"
    t.boolean  "thurs"
    t.boolean  "fri"
    t.boolean  "sat"
    t.boolean  "sun"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "fname"
    t.string   "lname"
    t.string   "phone_number"
    t.integer  "account_id"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "password_hash"
    t.string   "password_salt"
    t.boolean  "admin"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.boolean  "super_admin"
    t.boolean  "active",                 :default => true
    t.string   "customer_stripe_token"
  end

  create_table "userswimteams", :force => true do |t|
    t.integer  "user_id"
    t.integer  "swim_team_id"
    t.integer  "payment_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
