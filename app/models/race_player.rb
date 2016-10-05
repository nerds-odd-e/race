class RacePlayer < ApplicationRecord
  belongs_to :race_game

  def index
    id
  end

  def dice_face
    next_rand
  end
end
