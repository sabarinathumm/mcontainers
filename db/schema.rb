# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_21_030143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.boolean "is_active"
    t.string "isd_code"
    t.json "display_picture"
    t.integer "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "components", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comps", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "container_damaged_areas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "container_repair_areas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "title"
    t.string "created_by"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mode_numbers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.bigint "resource_owner_id"
    t.bigint "application_id"
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.string "previous_refresh_token", default: "", null: false
    t.index ["application_id"], name: "index_oauth_access_tokens_on_application_id"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "repair_list_item_uploads", force: :cascade do |t|
    t.string "attachment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "repair_list_items", force: :cascade do |t|
    t.bigint "repair_list_id", null: false
    t.string "uid"
    t.bigint "container_repair_area_id"
    t.bigint "container_damaged_area_id"
    t.bigint "repair_type_id"
    t.boolean "is_non_mearsk_not_applicable"
    t.float "non_mearsk_hours"
    t.integer "non_mearsk_material_cost_cents", default: 0, null: false
    t.string "non_mearsk_material_cost_currency", default: "USD", null: false
    t.text "non_mearsk_description"
    t.bigint "comp_id"
    t.bigint "rep_id"
    t.bigint "dam_id"
    t.bigint "component_id"
    t.bigint "event_id"
    t.text "location"
    t.bigint "unit_id"
    t.float "length"
    t.float "width"
    t.string "non_mearsk_id_source"
    t.boolean "is_mearsk_not_applicable"
    t.integer "mearsk_max_material_cost_cents", default: 0, null: false
    t.string "mearsk_max_material_cost_currency", default: "USD", null: false
    t.integer "mearsk_unit_material_cost_cents", default: 0, null: false
    t.string "mearsk_unit_material_cost_currency", default: "USD", null: false
    t.float "mearsk_hours_per_unit"
    t.float "mesrsk_max_pieces"
    t.float "mearsk_units"
    t.bigint "repair_mode_id"
    t.bigint "mode_number_id"
    t.string "repair_code"
    t.string "combined"
    t.string "mearsk_description"
    t.string "mearsk_id_source"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.index ["comp_id"], name: "index_repair_list_items_on_comp_id"
    t.index ["component_id"], name: "index_repair_list_items_on_component_id"
    t.index ["container_damaged_area_id"], name: "index_repair_list_items_on_container_damaged_area_id"
    t.index ["container_repair_area_id"], name: "index_repair_list_items_on_container_repair_area_id"
    t.index ["dam_id"], name: "index_repair_list_items_on_dam_id"
    t.index ["event_id"], name: "index_repair_list_items_on_event_id"
    t.index ["mode_number_id"], name: "index_repair_list_items_on_mode_number_id"
    t.index ["rep_id"], name: "index_repair_list_items_on_rep_id"
    t.index ["repair_list_id"], name: "index_repair_list_items_on_repair_list_id"
    t.index ["repair_mode_id"], name: "index_repair_list_items_on_repair_mode_id"
    t.index ["repair_type_id"], name: "index_repair_list_items_on_repair_type_id"
    t.index ["uid", "repair_list_id"], name: "index_repair_list_items_on_uid_and_repair_list_id", unique: true
    t.index ["unit_id"], name: "index_repair_list_items_on_unit_id"
  end

  create_table "repair_lists", force: :cascade do |t|
    t.string "name"
    t.boolean "is_active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "repair_modes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "repair_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reps", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "repair_list_items", "components"
  add_foreign_key "repair_list_items", "comps"
  add_foreign_key "repair_list_items", "container_damaged_areas"
  add_foreign_key "repair_list_items", "container_repair_areas"
  add_foreign_key "repair_list_items", "dams"
  add_foreign_key "repair_list_items", "events"
  add_foreign_key "repair_list_items", "mode_numbers"
  add_foreign_key "repair_list_items", "repair_lists"
  add_foreign_key "repair_list_items", "repair_modes"
  add_foreign_key "repair_list_items", "repair_types"
  add_foreign_key "repair_list_items", "reps"
  add_foreign_key "repair_list_items", "units"
end
