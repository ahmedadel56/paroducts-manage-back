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

ActiveRecord::Schema[7.0].define(version: 2023_03_01_101658) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bill_products", force: :cascade do |t|
    t.float "price"
    t.float "discount"
    t.integer "quantity"
    t.float "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bill_id", null: false
    t.bigint "product_id", null: false
    t.index ["bill_id"], name: "index_bill_products_on_bill_id"
    t.index ["product_id"], name: "index_bill_products_on_product_id"
  end

  create_table "bills", force: :cascade do |t|
    t.float "total_before_discount"
    t.float "total_dicount_percentage"
    t.float "total_discount_value"
    t.float "total_after_discount"
    t.float "paied"
    t.date "date"
    t.float "left"
    t.float "debit"
    t.float "total_debit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_bills_on_customer_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.text "address"
    t.float "total_debits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.integer "quantity"
    t.string "desired_quantity_integer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  add_foreign_key "bill_products", "bills"
  add_foreign_key "bill_products", "products"
  add_foreign_key "bills", "customers"
  add_foreign_key "products", "categories"
end
