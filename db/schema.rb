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

ActiveRecord::Schema[7.1].define(version: 2024_01_22_114124) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.bigint "topic_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_comments_on_topic_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "forums", force: :cascade do |t|
    t.string "name"
    t.string "access"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_forums_on_slug", unique: true
  end

  create_table "sub_forums", force: :cascade do |t|
    t.string "name"
    t.bigint "forum_id", null: false
    t.string "access"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["forum_id"], name: "index_sub_forums_on_forum_id"
    t.index ["slug"], name: "index_sub_forums_on_slug", unique: true
  end

  create_table "topics", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "forum_id", null: false
    t.bigint "user_id", null: false
    t.bigint "sub_forum_id", null: false
    t.boolean "is_locked", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["forum_id"], name: "index_topics_on_forum_id"
    t.index ["slug"], name: "index_topics_on_slug", unique: true
    t.index ["sub_forum_id"], name: "index_topics_on_sub_forum_id"
    t.index ["user_id"], name: "index_topics_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "password_digest"
    t.string "email"
    t.string "username"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "topics"
  add_foreign_key "comments", "users"
  add_foreign_key "sub_forums", "forums"
  add_foreign_key "topics", "forums"
  add_foreign_key "topics", "sub_forums"
  add_foreign_key "topics", "users"
end
