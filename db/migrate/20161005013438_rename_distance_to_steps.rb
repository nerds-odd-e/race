class RenameDistanceToSteps < ActiveRecord::Migration[6.0]
  def change
    rename_column :race_players, :distance, :steps
  end
end
