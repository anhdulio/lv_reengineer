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

ActiveRecord::Schema.define(version: 20170707062134) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "vi"
    t.string   "en"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contents", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.string   "short"
    t.boolean  "featured"
    t.string   "type"
    t.string   "slug"
    t.json     "payload"
    t.integer  "user_id"
    t.string   "author_name"
    t.string   "locale"
    t.datetime "published_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "category_id"
    t.index ["category_id"], name: "index_contents_on_category_id", using: :btree
    t.index ["slug"], name: "index_contents_on_slug", using: :btree
    t.index ["type"], name: "index_contents_on_type", using: :btree
    t.index ["user_id"], name: "index_contents_on_user_id", using: :btree
  end

  create_table "prices", force: :cascade do |t|
    t.integer  "price"
    t.datetime "updated_date"
    t.integer  "product_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "exchange_rate"
    t.index ["product_id"], name: "index_prices_on_product_id", using: :btree
  end

  add_foreign_key "contents", "categories"
end
