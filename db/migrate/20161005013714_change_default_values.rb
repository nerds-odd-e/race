class ChangeDefaultValues < ActiveRecord::Migration[5.0]
  def change
    change_column :race_games, :distance, :integer, :default => 20, :null => false
    rename_column :race_players, :scares, :scars
    change_column :race_players, :steps, :integer, :default => 0, :null => false
    change_column :race_players, :scars, :integer, :default => 0, :null => false
  end
end
