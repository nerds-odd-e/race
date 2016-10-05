class RacePlayer < ApplicationRecord
  belongs_to :race_game
  has_many   :race_moves

  def index
    id
  end

  def dice_face
    next_rand
  end

  def steps
    race_moves.size
  end
end
