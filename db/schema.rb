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

ActiveRecord::Schema.define(version: 0) do

  create_table "artists", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "collection_records", force: :cascade do |t|
    t.integer "collection_id"
    t.integer "vinyl_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["collection_id"], name: "index_collection_records_on_collection_id"
    t.index ["vinyl_id"], name: "index_collection_records_on_vinyl_id"
  end

  create_table "collections", force: :cascade do |t|
    t.text "name"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "vinyl_id"
    t.integer "user_id"
    t.text "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "star"
    t.index ["user_id"], name: "index_ratings_on_user_id"
    t.index ["vinyl_id"], name: "index_ratings_on_vinyl_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "username"
    t.text "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vinyls", force: :cascade do |t|
    t.text "title"
    t.integer "runtime"
    t.integer "year"
    t.text "image_url"
    t.integer "artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["artist_id"], name: "index_vinyls_on_artist_id"
  end

end
