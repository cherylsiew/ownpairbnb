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

ActiveRecord::Schema.define(version: 20170606082739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string "uid"
    t.string "token"
    t.string "provider"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "no_of_adults"
    t.integer "no_of_children"
    t.bigint "listing_id"
    t.integer "total_price"
    t.string "transaction_id"
    t.string "transaction_status"
    t.string "fourdigits"
    t.index ["listing_id"], name: "index_bookings_on_listing_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "listings", force: :cascade do |t|
    t.bigint "user_id"
    t.string "address1"
    t.string "address2"
    t.string "postcode"
    t.string "country"
    t.string "currency"
    t.integer "no_of_rooms"
    t.integer "no_of_beds"
    t.integer "no_of_bathrooms"
    t.integer "price_per_day"
    t.integer "price_per_week"
    t.integer "price_per_calendar_month"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "islands"
    t.string "smoking?"
    t.text "Property_Name"
    t.text "Property_Type"
    t.boolean "verification", default: false
    t.json "photos"
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.text "first_name"
    t.text "last_name"
    t.string "phone"
    t.integer "roles", default: 0
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "authentications", "users"
end
