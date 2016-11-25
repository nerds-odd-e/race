class Game < ApplicationRecord
  def is_move_next?(thrown_players)
    if total < Player.count
      return true
    end
    total == thrown_players
  end

  def moved_player_count
    Player.thrown.count
  end

  def self.start
    Game.last || Game.create
  end
end
