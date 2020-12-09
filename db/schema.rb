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

ActiveRecord::Schema.define(version: 2020_12_09_183457) do

  create_table "books", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "room_id", null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "price"
    t.integer "total_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_books_on_room_id"
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "reviews", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title", null: false
    t.text "comment"
    t.float "like", default: 1.0
    t.bigint "room_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "guest_id", null: false
    t.bigint "host_id", null: false
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["guest_id"], name: "index_reviews_on_guest_id"
    t.index ["host_id"], name: "index_reviews_on_host_id"
    t.index ["room_id"], name: "index_reviews_on_room_id"
  end

  create_table "room_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.string "image", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_room_images_on_room_id"
  end

  create_table "rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "home_type", null: false
    t.string "room_type", null: false
    t.integer "member", null: false
    t.integer "price", null: false
    t.integer "bed", null: false
    t.integer "bath", null: false
    t.string "name", null: false
    t.text "introduction", null: false
    t.string "location", null: false
    t.boolean "is_tv", default: false, null: false
    t.boolean "is_kitchen", default: false, null: false
    t.boolean "is_air", default: false, null: false
    t.boolean "is_heater", default: false, null: false
    t.boolean "is_wifi", default: false, null: false
    t.boolean "done", default: false, null: false
    t.boolean "pet", default: false, null: false
    t.boolean "parking", default: false, null: false
    t.boolean "breakfast", default: false, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.text "introduction"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["nickname"], name: "index_users_on_nickname", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "books", "rooms"
  add_foreign_key "books", "users"
  add_foreign_key "reviews", "books"
  add_foreign_key "reviews", "rooms"
  add_foreign_key "room_images", "rooms"
  add_foreign_key "rooms", "users"
end
