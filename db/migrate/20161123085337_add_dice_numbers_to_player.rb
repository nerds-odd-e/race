class AddDiceNumbersToPlayer < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :current_dice_number, :integer
  end
end
