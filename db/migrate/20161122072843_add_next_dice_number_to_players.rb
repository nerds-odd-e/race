class AddNextDiceNumberToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :next_dice_number, :integer
  end
end
