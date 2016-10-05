class RaceMove < ApplicationRecord
  belongs_to :race_player
  validates_numericality_of :tick, :greater_than => 0, :message => 'has not started yet'
  validates_uniqueness_of :tick, :message => 'already moved'
  before_validation :get_tick

  def super?
    choice == 'super'
  end

  def moves
    if super?
      race_player.dice_face
    else
      2 - race_player.dice_face % 2
    end
  end

  private
  def get_tick
    self.tick = race_player.race_game.tick
  end
end
