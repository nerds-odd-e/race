class AddNextRandToRacePlayer < ActiveRecord::Migration[5.0]
  def change
    add_column :race_players, :next_rand, :integer
  end
end
