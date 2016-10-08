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

ActiveRecord::Schema.define(version: 20_161_005_062_223) do
  create_table 'race_games', force: :cascade do |t|
    t.integer 'distance', default: 20, null: false
    t.datetime 'created_at',              null: false
    t.datetime 'updated_at',              null: false
    t.integer 'tick',       default: 0, null: false
  end

  create_table 'race_moves', force: :cascade do |t|
    t.integer 'race_player_id'
    t.string 'choice'
    t.integer 'dice_face'
    t.datetime 'created_at',     null: false
    t.datetime 'updated_at',     null: false
    t.integer 'tick'
    t.index ['race_player_id'], name: 'index_race_moves_on_race_player_id'
  end

  create_table 'race_players', force: :cascade do |t|
    t.integer 'race_game_id'
    t.integer 'steps',        default: 0, null: false
    t.integer 'old_scars',    default: 0, null: false
    t.datetime 'created_at',               null: false
    t.datetime 'updated_at',               null: false
    t.integer 'next_rand'
    t.index ['race_game_id'], name: 'index_race_players_on_race_game_id'
  end
end
