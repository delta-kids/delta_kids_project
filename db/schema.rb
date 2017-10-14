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

ActiveRecord::Schema.define(version: 20171014040850) do

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

  create_table "event_age_groups", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "age_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["age_group_id"], name: "index_event_age_groups_on_age_group_id"
    t.index ["event_id"], name: "index_event_age_groups_on_event_id"
  end

  create_table "event_program_types", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "program_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_program_types_on_event_id"
    t.index ["program_type_id"], name: "index_event_program_types_on_program_type_id"
  end

  create_table "event_taggings", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_taggings_on_event_id"
    t.index ["tag_id"], name: "index_event_taggings_on_tag_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.date "start_date"
    t.date "end_date"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "event_repeat"
    t.string "event_location"
    t.text "address"
    t.string "cost"
    t.string "registration"
    t.text "description"
    t.string "more_info"
    t.string "contact_name"
    t.string "contact_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "approved"
    t.bigint "organization_id"
    t.float "latitude"
    t.float "longitude"
    t.string "image"
    t.index ["organization_id"], name: "index_events_on_organization_id"
  end

  create_table "organization_age_groups", force: :cascade do |t|
    t.bigint "organization_id"
    t.bigint "age_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["age_group_id"], name: "index_organization_age_groups_on_age_group_id"
    t.index ["organization_id"], name: "index_organization_age_groups_on_organization_id"
  end

  create_table "organization_program_types", force: :cascade do |t|
    t.bigint "organization_id"
    t.bigint "program_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_organization_program_types_on_organization_id"
    t.index ["program_type_id"], name: "index_organization_program_types_on_program_type_id"
  end

  create_table "organization_taggings", force: :cascade do |t|
    t.bigint "organization_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_organization_taggings_on_organization_id"
    t.index ["tag_id"], name: "index_organization_taggings_on_tag_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "description"
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "program_age_groups", force: :cascade do |t|
    t.bigint "program_id"
    t.bigint "age_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["age_group_id"], name: "index_program_age_groups_on_age_group_id"
    t.index ["program_id"], name: "index_program_age_groups_on_program_id"
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
    t.bigint "program_type_id"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_programs_on_organization_id"
    t.index ["program_type_id"], name: "index_programs_on_program_type_id"
  end

  create_table "resource_age_groups", force: :cascade do |t|
    t.bigint "resource_id"
    t.bigint "age_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["age_group_id"], name: "index_resource_age_groups_on_age_group_id"
    t.index ["resource_id"], name: "index_resource_age_groups_on_resource_id"
  end

  create_table "resource_taggings", force: :cascade do |t|
    t.bigint "resource_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_id"], name: "index_resource_taggings_on_resource_id"
    t.index ["tag_id"], name: "index_resource_taggings_on_tag_id"
  end

  create_table "resource_topics", force: :cascade do |t|
    t.bigint "resource_id"
    t.bigint "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_id"], name: "index_resource_topics_on_resource_id"
    t.index ["topic_id"], name: "index_resource_topics_on_topic_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.boolean "feature"
    t.date "feature_start_date"
    t.date "feature_end_date"
    t.time "feature_start_time"
    t.time "feature_end_time"
    t.string "resource_location"
    t.text "description"
    t.string "contact_name"
    t.string "contact_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "approved"
    t.bigint "organization_id"
    t.string "published_date"
    t.string "string"
    t.string "resource_file"
    t.string "resource_type"
    t.index ["organization_id"], name: "index_resources_on_organization_id"
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

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string "topic_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "password_digest"
    t.boolean "is_admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "event_age_groups", "age_groups"
  add_foreign_key "event_age_groups", "events"
  add_foreign_key "event_program_types", "events"
  add_foreign_key "event_program_types", "program_types"
  add_foreign_key "event_taggings", "events"
  add_foreign_key "event_taggings", "tags"
  add_foreign_key "events", "organizations"
  add_foreign_key "organization_age_groups", "age_groups"
  add_foreign_key "organization_age_groups", "organizations"
  add_foreign_key "organization_program_types", "organizations"
  add_foreign_key "organization_program_types", "program_types"
  add_foreign_key "organization_taggings", "organizations"
  add_foreign_key "organization_taggings", "tags"
  add_foreign_key "program_age_groups", "age_groups"
  add_foreign_key "program_age_groups", "programs"
  add_foreign_key "programs", "organizations"
  add_foreign_key "programs", "program_types"
  add_foreign_key "resource_age_groups", "age_groups"
  add_foreign_key "resource_age_groups", "resources"
  add_foreign_key "resource_taggings", "resources"
  add_foreign_key "resource_taggings", "tags"
  add_foreign_key "resource_topics", "resources"
  add_foreign_key "resource_topics", "topics"
  add_foreign_key "resources", "organizations"
  add_foreign_key "services", "categories"
  add_foreign_key "services", "organizations"
  add_foreign_key "services", "service_types"
end
