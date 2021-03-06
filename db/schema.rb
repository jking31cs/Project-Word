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

ActiveRecord::Schema.define(:version => 20120223223928) do

  create_table "attachments", :force => true do |t|
    t.string "filename"
    t.string "content_type"
    t.binary "data"
  end

  create_table "courses", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "docs", :force => true do |t|
    t.integer  "course_id"
    t.date     "datetime"
    t.integer  "type_id"
    t.integer  "semester_id"
    t.integer  "owner_id"
    t.string   "prof"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "content_type"
    t.string   "data_path"
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.string   "major"
    t.integer  "gradYear"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "semesters", :force => true do |t|
    t.integer  "year"
    t.string   "season"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", :force => true do |t|
    t.string   "doc_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
