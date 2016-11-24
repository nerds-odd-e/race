class Game < ApplicationRecord
  def is_move_next?(total, thrown_players)
    if self.total < Player.count
      return true
    end
    total == thrown_players
  end
end
