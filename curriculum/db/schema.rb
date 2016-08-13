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

ActiveRecord::Schema.define(version: 20160813202831) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "complement"
    t.string   "city"
    t.string   "state"
    t.integer  "number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "candidate_id"
  end

  add_index "addresses", ["candidate_id"], name: "index_addresses_on_candidate_id"

  create_table "candidates", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "email"
    t.string   "homepage"
    t.string   "github"
    t.string   "linkedin"
    t.string   "goal"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "educations", force: :cascade do |t|
    t.string   "institute"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "degree"
    t.string   "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "candidate_id"
  end

  add_index "educations", ["candidate_id"], name: "index_educations_on_candidate_id"

  create_table "experiences", force: :cascade do |t|
    t.string   "company"
    t.string   "designation"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "candidate_id"
  end

  add_index "experiences", ["candidate_id"], name: "index_experiences_on_candidate_id"

  create_table "extracurriculars", force: :cascade do |t|
    t.string   "title"
    t.string   "location"
    t.string   "date"
    t.string   "description"
    t.string   "workload"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "candidate_id"
  end

  add_index "extracurriculars", ["candidate_id"], name: "index_extracurriculars_on_candidate_id"

  create_table "languages", force: :cascade do |t|
    t.string   "idiom"
    t.string   "reading"
    t.string   "writing"
    t.string   "conversation"
    t.string   "fluence"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "candidate_id"
  end

  add_index "languages", ["candidate_id"], name: "index_languages_on_candidate_id"

  create_table "phones", force: :cascade do |t|
    t.string   "number"
    t.string   "category"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "candidate_id"
  end

  add_index "phones", ["candidate_id"], name: "index_phones_on_candidate_id"

  create_table "positions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "candidate_id"
  end

  add_index "positions", ["candidate_id"], name: "index_positions_on_candidate_id"

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.string   "level"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "candidate_id"
  end

  add_index "skills", ["candidate_id"], name: "index_skills_on_candidate_id"

end
