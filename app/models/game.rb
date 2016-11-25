# frozen_string_literal: true
class Game < ApplicationRecord
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
