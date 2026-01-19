# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_01_19_141756) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "about_companies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name_projects_delivered"
    t.string "name_sastified_customers"
    t.string "name_uptime_garanteed"
    t.string "projects_delivered"
    t.string "sastified_customers"
    t.string "sub_title"
    t.text "text_about"
    t.string "text_about_first"
    t.string "text_about_second"
    t.string "title"
    t.datetime "updated_at", null: false
    t.string "uptime_garanteed"
  end

  create_table "card_diffs", force: :cascade do |t|
    t.json "cards"
    t.datetime "created_at", null: false
    t.string "subtitle"
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "card_services", force: :cascade do |t|
    t.json "cards"
    t.datetime "created_at", null: false
    t.string "sub_title"
    t.string "title_service"
    t.datetime "updated_at", null: false
  end

  create_table "card_teches", force: :cascade do |t|
    t.json "cards"
    t.datetime "created_at", null: false
    t.string "subtitle"
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.text "message"
    t.string "name"
    t.string "phone"
    t.datetime "updated_at", null: false
  end

  create_table "footers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "first_name_company"
    t.string "location"
    t.string "phone"
    t.string "second_name_company"
    t.string "sub_title"
    t.string "text_company_footer"
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.json "avatar_logo"
    t.datetime "created_at", null: false
    t.string "sub_title"
    t.string "title"
    t.datetime "updated_at", null: false
  end
end
