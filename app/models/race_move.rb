class RaceMove < ApplicationRecord # :nodoc:
  belongs_to :race_player
  validates_numericality_of(:tick, greater_than: 0,
                                   message: 'has not started yet')
  validates_uniqueness_of :tick, message: 'already moved'
  before_validation :fetch_tick
  after_initialize :fetch_dice_face

  def super?
    choice == 'super'
  end

  def moves
    if super?
      dice_face
    else
      2 - dice_face % 2
    end
  end

  private

  def fetch_tick
    self.tick = race_player.race_game.tick
  end

  def fetch_dice_face
    self.dice_face ||= race_player.next_rand
  end
end
