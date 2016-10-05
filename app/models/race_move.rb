class RaceMove < ApplicationRecord
  belongs_to :race_player

  def super?
    choice == 'super'
  end

  def moves
    if super?
      race_player.dice_face
    else
      2 - race_player.dice_face % 2
    end
  end
end
