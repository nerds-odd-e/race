class CreateRaceGames < ActiveRecord::Migration[5.0]
  def change
    create_table :race_games do |t|
      t.integer :distance

      t.timestamps
    end
  end
end
