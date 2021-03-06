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

ActiveRecord::Schema.define(version: 2020_07_29_172624) do

  create_table "clip_streamers", force: :cascade do |t|
    t.integer "clip_id"
    t.integer "streamer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "favorite"
  end

  create_table "clips", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.integer "streamer_id"
    t.integer "user_id"
    t.integer "review_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clips_reviews", id: false, force: :cascade do |t|
    t.integer "review_id", null: false
    t.integer "clip_id", null: false
    t.index ["clip_id", "review_id"], name: "index_clips_reviews_on_clip_id_and_review_id"
    t.index ["review_id", "clip_id"], name: "index_clips_reviews_on_review_id_and_clip_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.integer "streamer_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "body"
    t.integer "clip_id", null: false
    t.index ["clip_id"], name: "index_reviews_on_clip_id"
  end

  create_table "streamer_users", id: false, force: :cascade do |t|
    t.integer "streamer_id", null: false
    t.integer "user_id", null: false
    t.boolean "favorite"
    t.index ["streamer_id", "user_id"], name: "index_streamer_users_on_streamer_id_and_user_id"
    t.index ["user_id", "streamer_id"], name: "index_streamer_users_on_user_id_and_streamer_id"
  end

  create_table "streamers", force: :cascade do |t|
    t.string "name"
    t.integer "clip_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "favorite"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.integer "review_id"
    t.integer "clip_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "reviews", "clips"
end
