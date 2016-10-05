class AddTickToRaceGame < ActiveRecord::Migration[5.0]
  def change
    add_column :race_games, :tick, :integer, :default => 0, :null => false
  end
end
