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

ActiveRecord::Schema[7.1].define(version: 2016_10_16_065934) do
  create_table "race_games", force: :cascade do |t|
    t.integer "distance", default: 20, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tick", default: 0, null: false
  end

  create_table "race_moves", force: :cascade do |t|
    t.integer "race_player_id"
    t.string "choice"
    t.integer "dice_face", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tick", null: false
    t.index ["race_player_id"], name: "index_race_moves_on_race_player_id"
  end

  create_table "race_players", force: :cascade do |t|
    t.integer "race_game_id"
    t.integer "steps", default: 0, null: false
    t.integer "old_scars", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "next_rand"
    t.index ["race_game_id"], name: "index_race_players_on_race_game_id"
  end

end
