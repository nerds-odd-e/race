class RaceGame < ApplicationRecord # :nodoc:
  has_many :race_players

  def next_tick!
    self.tick += 1
  end

  def previous_tick!
    RaceMove.where(tick: tick).delete_all
    self.tick -= 1
    save!
  end

  def sorted_players
    race_players.sort_by(&:steps).reverse
  end
end
