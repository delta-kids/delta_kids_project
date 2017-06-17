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

ActiveRecord::Schema.define(version: 20170617222323) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "age_groups", force: :cascade do |t|
    t.string "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.bigint "age_group_id"
    t.string "description"
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["age_group_id"], name: "index_organizations_on_age_group_id"
  end

  create_table "program_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programs", force: :cascade do |t|
    t.text "description"
    t.string "registration"
    t.string "cost"
    t.bigint "age_group_id"
    t.bigint "program_type_id"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["age_group_id"], name: "index_programs_on_age_group_id"
    t.index ["organization_id"], name: "index_programs_on_organization_id"
    t.index ["program_type_id"], name: "index_programs_on_program_type_id"
  end

  create_table "service_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.bigint "service_type_id"
    t.text "description"
    t.bigint "organization_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_services_on_category_id"
    t.index ["organization_id"], name: "index_services_on_organization_id"
    t.index ["service_type_id"], name: "index_services_on_service_type_id"
  end

  add_foreign_key "organizations", "age_groups"
  add_foreign_key "programs", "age_groups"
  add_foreign_key "programs", "organizations"
  add_foreign_key "programs", "program_types"
  add_foreign_key "services", "categories"
  add_foreign_key "services", "organizations"
  add_foreign_key "services", "service_types"
end
