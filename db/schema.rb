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

ActiveRecord::Schema.define(version: 20171127035514) do

  create_table "adventures", force: :cascade do |t|
    t.string "title"
    t.string "story"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_adventures_on_user_id"
  end

  create_table "adventures_characters", id: false, force: :cascade do |t|
    t.integer "adventure_id", null: false
    t.integer "character_id", null: false
    t.index ["adventure_id", "character_id"], name: "index_adventures_characters_on_adventure_id_and_character_id"
    t.index ["character_id", "adventure_id"], name: "index_adventures_characters_on_character_id_and_adventure_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "profession"
    t.integer "level"
    t.string "race"
    t.integer "strength"
    t.integer "dexterity"
    t.integer "constitution"
    t.integer "intelligence"
    t.integer "wisdom"
    t.integer "charisma"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "backstory"
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "characters_maps", id: false, force: :cascade do |t|
    t.integer "map_id", null: false
    t.integer "character_id", null: false
    t.index ["character_id", "map_id"], name: "index_characters_maps_on_character_id_and_map_id"
    t.index ["map_id", "character_id"], name: "index_characters_maps_on_map_id_and_character_id"
  end

  create_table "maps", force: :cascade do |t|
    t.string "name"
    t.string "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "story"
    t.integer "adventure_id"
    t.integer "size"
    t.index ["adventure_id"], name: "index_maps_on_adventure_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
  end

end
