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

ActiveRecord::Schema.define(:version => 20120829224131) do

  create_table "drone_attacks", :force => true do |t|
    t.integer  "incident_year"
    t.integer  "al_qaida_min"
    t.integer  "al_qaida_max"
    t.integer  "taliban_min"
    t.integer  "taliban_max"
    t.integer  "civilians_min"
    t.integer  "civilians_max"
    t.integer  "forigeners_min"
    t.integer  "forigeners_max"
    t.integer  "total_died_min"
    t.integer  "total_died_max"
    t.integer  "injured_min"
    t.integer  "injured_max"
    t.boolean  "women"
    t.integer  "incident_date"
    t.datetime "display_date"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "location_id"
  end

  create_table "location_groups", :force => true do |t|
    t.string   "name"
    t.integer  "xcoordinate"
    t.integer  "ycoordinate"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "city"
    t.string   "province"
    t.string   "information"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "location_group_id"
  end

  create_table "maps", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "publishers", :force => true do |t|
    t.string   "name"
    t.integer  "publisher_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "reference_links", :force => true do |t|
    t.text     "url"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "drone_attack_id"
    t.integer  "publisher_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
