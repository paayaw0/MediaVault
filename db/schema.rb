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

ActiveRecord::Schema[8.0].define(version: 2024_06_10_125240) do
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "buckets", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.bigint "data_hub_id", null: false
    t.integer "parent_bucket_id"
    t.boolean "private", default: false, null: false
    t.integer "size", default: 0
    t.integer "data_object_count", default: 0
    t.datetime "last_accessed_at"
    t.string "tags", default: [], array: true
    t.uuid "unique_identifier", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_hub_id"], name: "index_buckets_on_data_hub_id"
  end

  create_table "data_hubs", force: :cascade do |t|
    t.string "drive_id", null: false
    t.integer "storage_quota", default: 15, null: false
    t.integer "used_storage", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.integer "plan_type", default: 0, null: false
    t.string "region"
    t.integer "backup_status"
    t.integer "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data_objects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "data_hub_id", null: false
    t.bigint "bucket_id", null: false
    t.boolean "private", default: false, null: false
    t.integer "size", default: 0, null: false
    t.datetime "last_accessed_at"
    t.string "tags", default: [], array: true
    t.string "checksum", null: false
    t.string "object_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bucket_id"], name: "index_data_objects_on_bucket_id"
    t.index ["data_hub_id"], name: "index_data_objects_on_data_hub_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "buckets", "data_hubs"
  add_foreign_key "data_objects", "buckets"
  add_foreign_key "data_objects", "data_hubs"
end
