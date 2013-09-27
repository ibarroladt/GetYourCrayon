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

ActiveRecord::Schema.define(version: 20130926234928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drawings", force: true do |t|
    t.text     "content"
<<<<<<< HEAD
    t.integer  "website_id"
=======
    t.integer  "url_id_id"
>>>>>>> master
    t.datetime "created_at"
    t.datetime "updated_at"
  end

<<<<<<< HEAD
  add_index "drawings", ["website_id"], name: "index_drawings_on_website_id", using: :btree
=======
  add_index "drawings", ["url_id_id"], name: "index_drawings_on_url_id_id", using: :btree
>>>>>>> master

  create_table "websites", force: true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
