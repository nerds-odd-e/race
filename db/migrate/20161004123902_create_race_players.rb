class CreateRacePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :race_players do |t|
      t.references :race_game, foreign_key: true
      t.integer :distance
      t.integer :scares

      t.timestamps
    end
  end
end
