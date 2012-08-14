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

ActiveRecord::Schema.define(:version => 20120814181105) do

  create_table "drone_attacks", :force => true do |t|
    t.integer  "incident_year"
    t.string   "location"
    t.string   "province"
    t.string   "city"
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
    t.string   "url"
    t.datetime "incident_date"
    t.datetime "display_date"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end
