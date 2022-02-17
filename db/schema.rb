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

ActiveRecord::Schema.define(version: 2022_01_16_201943) do

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.string "username", default: [], array: true
    t.string "content", default: [], array: true
    t.datetime "sendtime", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "ticket_id", null: false
    t.index ["ticket_id"], name: "index_comments_on_ticket_id"
  end

  create_table "employeeschats", force: :cascade do |t|
    t.string "username", default: [], array: true
    t.string "employeeGroup", default: [], array: true
    t.datetime "sendtime", default: [], array: true
    t.string "content", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "ticket_id", null: false
    t.index ["ticket_id"], name: "index_employeeschats_on_ticket_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "info"
    t.integer "infoticketid"
    t.boolean "status", default: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "progresses", force: :cascade do |t|
    t.string "username"
    t.string "department"
    t.string "subusername", default: [], array: true
    t.string "subdepartment", default: [], array: true
    t.boolean "status", default: [], array: true
    t.string "statusDesc", default: [], array: true
    t.string "info", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "ticket_id", null: false
    t.index ["ticket_id"], name: "index_progresses_on_ticket_id"
  end

  create_table "settings", force: :cascade do |t|
    t.boolean "two_factor", default: false
    t.boolean "email_comfirmed", default: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_settings_on_user_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "user"
    t.string "title"
    t.string "assign"
    t.string "statusinfo"
    t.string "ticketDepartment"
    t.boolean "status", default: false
    t.boolean "readed", default: false
    t.string "watchers", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tokens", force: :cascade do |t|
    t.string "password_token"
    t.datetime "password_time"
    t.string "email_token"
    t.datetime "email_time"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_tokens_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "encrypted_password"
    t.string "email"
    t.string "mobile"
    t.string "mobileCountryCode"
    t.string "salt"
    t.string "group", default: "User"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "tickets"
  add_foreign_key "employeeschats", "tickets"
  add_foreign_key "notifications", "users"
  add_foreign_key "progresses", "tickets"
  add_foreign_key "settings", "users"
  add_foreign_key "tokens", "users"
end
