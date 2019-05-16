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

ActiveRecord::Schema.define(version: 2019_05_16_170451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "houses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "house_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_rooms_on_house_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "room_id"
    t.integer "type"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rag"
    t.index ["room_id"], name: "index_tasks_on_room_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "emoji"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_houses", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_users_houses_on_house_id"
    t.index ["user_id"], name: "index_users_houses_on_user_id"
  end

  create_table "users_tasks", force: :cascade do |t|
    t.bigint "task_id"
    t.bigint "user_id"
    t.boolean "completed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_users_tasks_on_task_id"
    t.index ["user_id"], name: "index_users_tasks_on_user_id"
  end

  add_foreign_key "rooms", "houses"
  add_foreign_key "tasks", "rooms"
  add_foreign_key "users_houses", "houses"
  add_foreign_key "users_houses", "users"
  add_foreign_key "users_tasks", "tasks"
  add_foreign_key "users_tasks", "users"
end
