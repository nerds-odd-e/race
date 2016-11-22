class Game < ApplicationRecord
  def check_move_flag(total, thrown_players)
    if self.total < Player.count
      return true
    end
    total == thrown_players
  end
end
