class RaceGame < ApplicationRecord # :nodoc:
  has_many :race_players

  def next_tick!
    self.tick += 1
  end

  def sorted_players
    race_players.sort_by(&:steps).reverse
  end
end
