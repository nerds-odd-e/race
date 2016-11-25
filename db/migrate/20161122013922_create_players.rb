# frozen_string_literal: true
class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.integer :distance, default: 0
      t.integer :damage, default: 0

      t.timestamps
    end
  end
end
