# frozen_string_literal: true
class Game < ApplicationRecord
  def is_move_next?(thrown_players)
    return true if total < Player.count
    total == thrown_players
  end

  def moved_player_count
    Player.thrown.count
  end

  def total_player_count
    Player.count
  end

  def self.start
    Game.last || Game.create
  end
end
