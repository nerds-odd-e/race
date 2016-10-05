class RenameScarsToOldScars < ActiveRecord::Migration[5.0]
  def change
    rename_column :race_players, :scars, :old_scars
  end
end
