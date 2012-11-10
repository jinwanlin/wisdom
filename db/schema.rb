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

ActiveRecord::Schema.define(:version => 20121110102642) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "address"
    t.string   "contact"
    t.string   "workingtime"
    t.integer  "author_id"
    t.integer  "forum_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "attachments", :force => true do |t|
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "source_file_name"
    t.string   "source_content_type"
    t.integer  "source_file_size"
    t.datetime "source_updated_at"
    t.integer  "owner_id"
    t.string   "owner_type"
  end

  create_table "authors", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.integer  "age"
    t.string   "sex"
    t.string   "contact"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "communities", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.text     "desc"
    t.string   "score"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "community_health_stations", :force => true do |t|
    t.string   "name"
    t.string   "community_name"
    t.string   "location"
    t.string   "essence"
    t.text     "desc"
    t.string   "contact"
    t.string   "workingtime"
    t.text     "openoffice"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "coupons", :force => true do |t|
    t.string   "merchant_name"
    t.string   "merchant_contact"
    t.string   "merchant_address"
    t.string   "title"
    t.text     "desc"
    t.string   "expire"
    t.string   "category"
    t.string   "cover"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "doctors", :force => true do |t|
    t.string   "name"
    t.string   "level"
    t.string   "sex"
    t.string   "age"
    t.string   "hostpital"
    t.string   "office"
    t.text     "major"
    t.text     "desc"
    t.string   "out_call"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "forums", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.string   "need_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "hospitals", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "essence"
    t.text     "desc"
    t.string   "contact"
    t.string   "workingtime"
    t.text     "openoffice"
    t.string   "level"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "houses", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "contact"
    t.string   "location"
    t.string   "service_type"
    t.string   "v_type"
    t.string   "cover"
    t.text     "desc"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "materials", :force => true do |t|
    t.string   "material_type"
    t.string   "name"
    t.string   "amount"
    t.integer  "article_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "merchants", :force => true do |t|
    t.string   "app_type"
    t.string   "service_type"
    t.string   "name"
    t.string   "title"
    t.string   "business_hours"
    t.string   "contact"
    t.integer  "position"
    t.string   "location"
    t.text     "desc"
    t.string   "v_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "news", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "notes", :force => true do |t|
    t.integer  "parent_id"
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "community_id"
    t.integer  "children_count", :default => 0
  end

  add_index "notes", ["user_id"], :name => "index_notes_on_user_id"

  create_table "repositories", :force => true do |t|
    t.string   "base_type"
    t.string   "title"
    t.text     "content"
    t.string   "content_url"
    t.string   "category"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "seconds", :force => true do |t|
    t.string   "title"
    t.string   "owner"
    t.float    "price"
    t.integer  "views"
    t.string   "rate"
    t.string   "contact"
    t.text     "desc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "steps", :force => true do |t|
    t.text     "desc"
    t.integer  "position"
    t.integer  "article_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_communities", :force => true do |t|
    t.integer  "user_id"
    t.integer  "community_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.string   "sina_id"
    t.string   "qq_id"
    t.string   "name"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "community_id"
    t.string   "avatar"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "weibo_tokens", :force => true do |t|
    t.string   "token"
    t.string   "account_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
