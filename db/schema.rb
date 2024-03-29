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

ActiveRecord::Schema.define(:version => 20130514113036) do

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "phone"
    t.decimal  "default_billing_rate"
    t.string   "default_billing_unit"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "postcode"
  end

  add_index "clients", ["name"], :name => "index_clients_on_name", :unique => true

  create_table "contacts", :force => true do |t|
    t.integer  "client_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.boolean  "invoice_contact", :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "contacts", ["client_id", "created_at"], :name => "index_contacts_on_client_id_and_created_at"

  create_table "hours", :force => true do |t|
    t.integer  "project_id"
    t.date     "performed_on"
    t.time     "start_time"
    t.time     "finish_time"
    t.decimal  "billable_unit_quantity"
    t.string   "activity_type"
    t.string   "billing_status",         :default => "unbilled"
    t.integer  "user_id"
    t.decimal  "billing_rate"
    t.string   "billing_unit",           :default => "hours"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.string   "description"
  end

  create_table "projects", :force => true do |t|
    t.string   "project_name"
    t.string   "project_description"
    t.boolean  "active"
    t.integer  "client_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
