class CreateRaceMoves < ActiveRecord::Migration[5.0]
  def change
    create_table :race_moves do |t|
      t.references :race_player, foreign_key: true
      t.string :choice
      t.integer :dice_face

      t.timestamps
    end
  end
end
