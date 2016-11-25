# frozen_string_literal: true
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

ActiveRecord::Schema.define(version: 20_161_124_080_620) do
  create_table 'games', force: :cascade do |t|
    t.integer  'total', default: 0
    t.datetime 'created_at',             null: false
    t.datetime 'updated_at',             null: false
  end

  create_table 'players', force: :cascade do |t|
    t.integer  'distance',            default: 0
    t.integer  'damage',              default: 0
    t.datetime 'created_at',                          null: false
    t.datetime 'updated_at',                          null: false
    t.integer  'next_dice_number'
    t.boolean  'throw_flag',          default: false
    t.integer  'steps',               default: 0, null: false
    t.integer  'current_dice_number'
    t.string   'choice'
  end
end
