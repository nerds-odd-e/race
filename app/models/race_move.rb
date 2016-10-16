class RaceMove < ApplicationRecord # :nodoc:
  belongs_to :race_player
  validates_numericality_of(:tick, greater_than: 0,
                                   message: 'has not started yet')
  validates_uniqueness_of(:tick, scope: :race_player_id,
                                 message: 'already moved')
  def super?
    choice == 'super'
  end

  def moves
    if super?
      dice_face
    else
      2 - dice_face % 2
    end
  end
end
