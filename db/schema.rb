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

ActiveRecord::Schema.define(version: 2020_07_17_192454) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boardgames", force: :cascade do |t|
    t.integer "BGGid"
    t.string "title"
    t.string "description"
    t.string "thumbnail"
    t.string "image"
    t.string "playtime"
    t.string "minplayers"
    t.string "maxplayers"
    t.string "BGGrating"
    t.string "BGGrank"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "brought_games", force: :cascade do |t|
    t.bigint "my_game_id", null: false
    t.bigint "meet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["meet_id"], name: "index_brought_games_on_meet_id"
    t.index ["my_game_id"], name: "index_brought_games_on_my_game_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "designers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "game_categories", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "boardgame_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["boardgame_id"], name: "index_game_categories_on_boardgame_id"
    t.index ["category_id"], name: "index_game_categories_on_category_id"
  end

  create_table "game_designers", force: :cascade do |t|
    t.bigint "boardgame_id", null: false
    t.bigint "designer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["boardgame_id"], name: "index_game_designers_on_boardgame_id"
    t.index ["designer_id"], name: "index_game_designers_on_designer_id"
  end

  create_table "game_mechanics", force: :cascade do |t|
    t.bigint "mechanic_id", null: false
    t.bigint "boardgame_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["boardgame_id"], name: "index_game_mechanics_on_boardgame_id"
    t.index ["mechanic_id"], name: "index_game_mechanics_on_mechanic_id"
  end

  create_table "game_publishers", force: :cascade do |t|
    t.bigint "boardgame_id", null: false
    t.bigint "publisher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["boardgame_id"], name: "index_game_publishers_on_boardgame_id"
    t.index ["publisher_id"], name: "index_game_publishers_on_publisher_id"
  end

  create_table "invites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "meet_id", null: false
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["meet_id"], name: "index_invites_on_meet_id"
    t.index ["user_id"], name: "index_invites_on_user_id"
  end

  create_table "mechanics", force: :cascade do |t|
    t.string "mechanic"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "meets", force: :cascade do |t|
    t.string "description"
    t.string "location"
    t.integer "zip"
    t.string "size"
    t.string "name"
    t.datetime "when"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_meets_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "text"
    t.bigint "conversation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
  end

  create_table "my_games", force: :cascade do |t|
    t.bigint "boardgame_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["boardgame_id"], name: "index_my_games_on_boardgame_id"
    t.index ["user_id"], name: "index_my_games_on_user_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "boardgame_id", null: false
    t.bigint "user_id", null: false
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["boardgame_id"], name: "index_ratings_on_boardgame_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "BGGusername"
    t.string "address1"
    t.string "address2"
    t.integer "zip"
    t.string "email"
    t.string "about_me"
    t.string "as_host"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "brought_games", "meets"
  add_foreign_key "brought_games", "my_games"
  add_foreign_key "game_categories", "boardgames"
  add_foreign_key "game_categories", "categories"
  add_foreign_key "game_designers", "boardgames"
  add_foreign_key "game_designers", "designers"
  add_foreign_key "game_mechanics", "boardgames"
  add_foreign_key "game_mechanics", "mechanics"
  add_foreign_key "game_publishers", "boardgames"
  add_foreign_key "game_publishers", "publishers"
  add_foreign_key "invites", "meets"
  add_foreign_key "invites", "users"
  add_foreign_key "meets", "users"
  add_foreign_key "messages", "conversations"
  add_foreign_key "my_games", "boardgames"
  add_foreign_key "my_games", "users"
  add_foreign_key "ratings", "boardgames"
  add_foreign_key "ratings", "users"
end
