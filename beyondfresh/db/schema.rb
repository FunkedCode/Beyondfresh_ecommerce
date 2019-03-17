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

ActiveRecord::Schema.define(version: 2019_03_16_184910) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attributes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.text "salt"
    t.text "hash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_products", force: :cascade do |t|
    t.decimal "total_price"
    t.integer "qty"
    t.decimal "unit_price"
    t.bigint "orders_id"
    t.bigint "products_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["orders_id"], name: "index_order_products_on_orders_id"
    t.index ["products_id"], name: "index_order_products_on_products_id"
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "tax"
    t.decimal "shipping"
    t.decimal "sub_total"
    t.decimal "total"
    t.bigint "order_status_id"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["order_status_id"], name: "index_orders_on_order_status_id"
  end

  create_table "product_attributes", force: :cascade do |t|
    t.string "product_name"
    t.integer "qty"
    t.text "notes"
    t.bigint "product_id"
    t.bigint "attribute_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attribute_id"], name: "index_product_attributes_on_attribute_id"
    t.index ["product_id"], name: "index_product_attributes_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.decimal "price"
    t.text "description"
    t.string "image"
    t.decimal "serving_size"
    t.text "ingredient_list"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "order_products", "orders", column: "orders_id"
  add_foreign_key "order_products", "products", column: "products_id"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "order_statuses"
  add_foreign_key "product_attributes", "attributes"
  add_foreign_key "product_attributes", "products"
end
