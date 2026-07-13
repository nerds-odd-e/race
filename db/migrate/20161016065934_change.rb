class Change < ActiveRecord::Migration[6.0]
  def change
    change_column_null :race_moves, :dice_face, false
    change_column_null :race_moves, :tick, false
  end
end
