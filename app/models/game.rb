class Game < ApplicationRecord
  def is_move_next?(thrown_players)
    if total < Player.count
      return true
    end
    total == thrown_players
  end
end
