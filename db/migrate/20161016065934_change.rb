class Change < ActiveRecord::Migration[5.0]
  def change
    change_column_null :race_moves, :dice_face, false
    change_column_null :race_moves, :tick, false
  end
end
