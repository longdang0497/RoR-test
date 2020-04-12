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

ActiveRecord::Schema.define(version: 2020_04_12_184332) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "phone", default: ""
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", default: ""
    t.index ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.bigint "user_id", null: false
    t.text "messages"
    t.string "profession", null: false
    t.string "service_length", null: false
    t.string "desired_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "admin_id"
    t.index ["admin_id"], name: "index_bookings_on_admin_id"
    t.index ["room_id"], name: "index_bookings_on_room_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "buildings", force: :cascade do |t|
    t.string "city"
    t.integer "build_year"
    t.string "equipments"
    t.integer "floor_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "district", default: ""
    t.string "address", default: ""
    t.bigint "admin_id"
    t.string "name", default: ""
    t.index ["admin_id"], name: "index_buildings_on_admin_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "building_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["building_id"], name: "index_favorites_on_building_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "fee_units", force: :cascade do |t|
    t.bigint "admin_id", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_fee_units_on_admin_id"
  end

  create_table "floors", force: :cascade do |t|
    t.string "floor_num"
    t.integer "total_room"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "building_id"
    t.bigint "admin_id"
    t.index ["admin_id"], name: "index_floors_on_admin_id"
    t.index ["building_id"], name: "index_floors_on_building_id"
  end

  create_table "management_fees", force: :cascade do |t|
    t.integer "price"
    t.bigint "fee_unit_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "admin_id"
    t.index ["admin_id"], name: "index_management_fees_on_admin_id"
    t.index ["fee_unit_id"], name: "index_management_fees_on_fee_unit_id"
  end

  create_table "rental_fees", force: :cascade do |t|
    t.integer "price"
    t.bigint "fee_unit_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "admin_id"
    t.index ["admin_id"], name: "index_rental_fees_on_admin_id"
    t.index ["fee_unit_id"], name: "index_rental_fees_on_fee_unit_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.float "acreage"
    t.string "room_num"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "floor_id"
    t.bigint "admin_id"
    t.bigint "rental_fee_id"
    t.bigint "management_fee_id"
    t.index ["admin_id"], name: "index_rooms_on_admin_id"
    t.index ["floor_id"], name: "index_rooms_on_floor_id"
    t.index ["management_fee_id"], name: "index_rooms_on_management_fee_id"
    t.index ["rental_fee_id"], name: "index_rooms_on_rental_fee_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "phone", default: ""
    t.string "identity", default: ""
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", default: ""
    t.integer "gender"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "admins"
  add_foreign_key "bookings", "rooms"
  add_foreign_key "bookings", "users"
  add_foreign_key "buildings", "admins"
  add_foreign_key "favorites", "buildings"
  add_foreign_key "favorites", "users"
  add_foreign_key "fee_units", "admins"
  add_foreign_key "floors", "admins"
  add_foreign_key "floors", "buildings"
  add_foreign_key "management_fees", "admins"
  add_foreign_key "management_fees", "fee_units"
  add_foreign_key "rental_fees", "admins"
  add_foreign_key "rental_fees", "fee_units"
  add_foreign_key "rooms", "admins"
  add_foreign_key "rooms", "floors"
  add_foreign_key "rooms", "management_fees"
  add_foreign_key "rooms", "rental_fees"
end
