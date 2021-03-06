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

ActiveRecord::Schema.define(:version => 20110507035755) do

  create_table "artworks", :force => true do |t|
    t.string   "object"
    t.string   "creator"
    t.string   "title"
    t.text     "description"
    t.string   "location"
    t.string   "recfrom"
    t.date     "date"
    t.string   "filename"
    t.text     "notes"
    t.boolean  "onDisplay"
    t.string   "thumbnail"
    t.float    "lat"
    t.float    "lng"
    t.boolean  "issuper"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exhibitions", :force => true do |t|
    t.string   "name"
    t.date     "open"
    t.date     "close"
    t.text     "description"
    t.string   "location"
    t.string   "image1"
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.string   "image5"
    t.time     "opening"
    t.string   "filename"
    t.time     "opening_end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tour_items", :force => true do |t|
    t.integer  "artwork_id"
    t.integer  "tour_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tours", :force => true do |t|
    t.text     "desc"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "issuper"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
