class AddTickToRaceMove < ActiveRecord::Migration[5.0]
  def change
    add_column :race_moves, :tick, :integer
  end
end
