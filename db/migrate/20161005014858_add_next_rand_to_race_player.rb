class AddNextRandToRacePlayer < ActiveRecord::Migration[6.0]
  def change
    add_column :race_players, :next_rand, :integer
  end
end
