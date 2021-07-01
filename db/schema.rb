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

ActiveRecord::Schema.define(version: 2021_07_01_143039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "applies", force: :cascade do |t|
    t.string "job_title"
    t.text "description"
    t.string "status"
    t.float "progression_bar"
    t.string "location"
    t.float "ranking"
    t.string "url"
    t.bigint "user_id", null: false
    t.bigint "organization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "finalstatus", default: "Pending"
    t.date "updatedate", default: "2021-07-01"
    t.index ["organization_id"], name: "index_applies_on_organization_id"
    t.index ["user_id"], name: "index_applies_on_user_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "tile"
    t.text "content"
    t.string "author"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contact_applies", force: :cascade do |t|
    t.bigint "contact_id", null: false
    t.bigint "apply_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["apply_id"], name: "index_contact_applies_on_apply_id"
    t.index ["contact_id"], name: "index_contact_applies_on_contact_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "linkedin_url"
    t.bigint "organization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_contacts_on_organization_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.text "description"
    t.string "location"
    t.string "category"
    t.bigint "user_id", null: false
    t.bigint "organization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_experiences_on_organization_id"
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "interviews", force: :cascade do |t|
    t.date "date"
    t.string "step"
    t.text "notes"
    t.bigint "apply_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.time "start_time"
    t.time "end_time"
    t.index ["apply_id"], name: "index_interviews_on_apply_id"
  end

  create_table "notification_applies", force: :cascade do |t|
    t.boolean "read", default: false
    t.string "description"
    t.bigint "apply_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["apply_id"], name: "index_notification_applies_on_apply_id"
  end

  create_table "notification_interviews", force: :cascade do |t|
    t.boolean "read", default: false
    t.string "description"
    t.bigint "interview_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["interview_id"], name: "index_notification_interviews_on_interview_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "logo"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.float "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "interview_id"
    t.integer "votes", default: 0
    t.index ["interview_id"], name: "index_reviews_on_interview_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "linkedin_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "applies", "organizations"
  add_foreign_key "applies", "users"
  add_foreign_key "contact_applies", "applies"
  add_foreign_key "contact_applies", "contacts"
  add_foreign_key "contacts", "organizations"
  add_foreign_key "experiences", "organizations"
  add_foreign_key "experiences", "users"
  add_foreign_key "interviews", "applies"
  add_foreign_key "notification_applies", "applies"
  add_foreign_key "notification_interviews", "interviews"
  add_foreign_key "reviews", "interviews"
end
