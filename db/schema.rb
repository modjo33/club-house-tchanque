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

ActiveRecord::Schema[7.2].define(version: 2026_02_14_120000) do
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

  create_table "beverages", force: :cascade do |t|
    t.string "category", null: false
    t.string "name", null: false
    t.text "description"
    t.decimal "price_small", precision: 8, scale: 2
    t.decimal "price_medium", precision: 8, scale: 2
    t.decimal "price_large", precision: 8, scale: 2
    t.decimal "price", precision: 8, scale: 2
    t.integer "position", default: 0
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category", "position"], name: "index_beverages_on_category_and_position"
    t.index ["category"], name: "index_beverages_on_category"
  end

  create_table "carousel_images", force: :cascade do |t|
    t.string "page"
    t.integer "position"
    t.string "alt_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "section", default: "main"
    t.index ["page", "section", "position"], name: "index_carousel_images_on_page_and_section_and_position"
  end

  create_table "cuisine_images", force: :cascade do |t|
    t.string "title"
    t.integer "position", default: 0, null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_cuisine_images_on_active"
    t.index ["position"], name: "index_cuisine_images_on_position"
  end

  create_table "events", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.date "start_date", null: false
    t.date "end_date"
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_events_on_active"
    t.index ["start_date"], name: "index_events_on_start_date"
  end

  create_table "formulas", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_items", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "page_contents", force: :cascade do |t|
    t.string "slug"
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_page_contents_on_slug", unique: true
  end

  create_table "site_photos", force: :cascade do |t|
    t.string "location", null: false
    t.string "alt_text"
    t.integer "position", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location", "position"], name: "index_site_photos_on_location_and_position"
  end

  create_table "wine_items", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.string "appellation"
    t.decimal "glass_price"
    t.decimal "bottle_price"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
