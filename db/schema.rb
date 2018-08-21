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

ActiveRecord::Schema.define(version: 2018_08_20_204156) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chefs", force: :cascade do |t|
    t.string "name"
    t.string "avatar"
    t.string "profile"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_chefs_on_restaurant_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "tel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "images", force: :cascade do |t|
    t.string "image_url"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_images_on_restaurant_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.integer "price"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_menus_on_restaurant_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "time"
    t.string "request"
    t.string "status", default: "pending", null: false
    t.bigint "restaurant_id"
    t.bigint "customer_id"
    t.integer "seats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_reservations_on_customer_id"
    t.index ["restaurant_id"], name: "index_reservations_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "dresscode"
    t.string "opening_hours"
    t.string "category"
    t.string "style"
    t.string "cuisine"
    t.string "tel"
    t.string "country"
    t.string "city"
    t.string "street"
    t.string "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_restaurants_on_email", unique: true
    t.index ["reset_password_token"], name: "index_restaurants_on_reset_password_token", unique: true
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.string "comment"
    t.bigint "customer_id"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_reviews_on_customer_id"
    t.index ["restaurant_id"], name: "index_reviews_on_restaurant_id"
  end

  add_foreign_key "chefs", "restaurants"
  add_foreign_key "images", "restaurants"
  add_foreign_key "menus", "restaurants"
  add_foreign_key "reservations", "customers"
  add_foreign_key "reservations", "restaurants"
  add_foreign_key "reviews", "customers"
  add_foreign_key "reviews", "restaurants"
end
