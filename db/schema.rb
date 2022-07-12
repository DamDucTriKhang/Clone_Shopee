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

ActiveRecord::Schema.define(version: 2022_07_12_025647) do

  create_table "carts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "contact_name"
    t.string "phone"
    t.string "address"
    t.integer "contact_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.integer "price"
    t.integer "quantity"
    t.integer "itemable_id"
    t.string "itemable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "logistics", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.integer "transport_fee"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "contact_id", null: false
    t.integer "logistic_id", null: false
    t.integer "voucher_id", null: false
    t.integer "total_price"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["contact_id"], name: "index_orders_on_contact_id"
    t.index ["logistic_id"], name: "index_orders_on_logistic_id"
    t.index ["voucher_id"], name: "index_orders_on_voucher_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "product_id", null: false
    t.string "name"
    t.text "description"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_products_on_product_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "stock_id", null: false
    t.string "quatity"
    t.datetime "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stock_id"], name: "index_purchases_on_stock_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "address"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.integer "product_id", null: false
    t.string "quatity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_stocks_on_product_id"
  end

  create_table "user_vouchers", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "voucher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_vouchers_on_user_id"
    t.index ["voucher_id"], name: "index_user_vouchers_on_voucher_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vouchers", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "discount_amount"
    t.integer "discount_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "carts", "users"
  add_foreign_key "contacts", "users"
  add_foreign_key "orders", "contacts"
  add_foreign_key "orders", "logistics"
  add_foreign_key "orders", "vouchers"
  add_foreign_key "products", "products"
  add_foreign_key "purchases", "stocks"
  add_foreign_key "stocks", "products"
  add_foreign_key "user_vouchers", "users"
  add_foreign_key "user_vouchers", "vouchers"
end
