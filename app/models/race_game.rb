class RaceGame < ApplicationRecord # :nodoc:
  has_many :race_players

  def next_tick!
    self.tick += 1
  end
end
