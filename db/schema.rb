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

ActiveRecord::Schema.define(version: 2019_11_28_164954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "session_id"
    t.bigint "seat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id"
    t.index ["order_id"], name: "index_bookings_on_order_id"
    t.index ["seat_id"], name: "index_bookings_on_seat_id"
    t.index ["session_id"], name: "index_bookings_on_session_id"
  end

  create_table "cinemas", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.float "latitude"
    t.float "longitude"
    t.integer "distance"
    t.string "map_url"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state", default: "pending"
    t.integer "price_cents", default: 0, null: false
    t.string "checkout_session_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.bigint "cinema_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cinema_id"], name: "index_rooms_on_cinema_id"
  end

  create_table "seats", force: :cascade do |t|
    t.integer "row"
    t.integer "column"
    t.bigint "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "booked", default: false
    t.index ["room_id"], name: "index_seats_on_room_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "room_id"
    t.bigint "movie_id"
    t.datetime "showtime"
    t.integer "base_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "max_discount"
    t.integer "min_empty_seats"
    t.integer "hours_for_discount"
    t.index ["movie_id"], name: "index_sessions_on_movie_id"
    t.index ["room_id"], name: "index_sessions_on_room_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "stripe_customer_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "orders"
  add_foreign_key "bookings", "seats"
  add_foreign_key "bookings", "sessions"
  add_foreign_key "orders", "users"
  add_foreign_key "rooms", "cinemas"
  add_foreign_key "seats", "rooms"
  add_foreign_key "sessions", "movies"
  add_foreign_key "sessions", "rooms"
end
