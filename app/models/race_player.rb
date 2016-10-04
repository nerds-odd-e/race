class RacePlayer < ApplicationRecord
  belongs_to :race_game

  def index
    id
  end
end
