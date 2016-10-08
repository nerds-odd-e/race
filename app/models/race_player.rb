class RacePlayer < ApplicationRecord
  belongs_to :race_game
  has_many :race_moves

  def index
    id
  end

  def scars
    result_of_moves.scars
  end

  def dice_face
    race_moves.last&.dice_face
  end

  def steps
    result_of_moves.steps
  end

  def next_rand
    self[:next_rand] || 1 + rand(6)
  end

  private

  def result_of_moves
    race_moves.reduce(Struct.new(:steps, :scars).new(0, old_scars)) do |sum, move|
      sum.steps += [0, move.moves - sum.scars].max
      sum.scars += (move.super? ? 1 : 0)
      sum
    end
  end
end
