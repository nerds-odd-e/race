class RacePlayer < ApplicationRecord # :nodoc:
  belongs_to :race_game
  has_many :race_moves do
    def create(args, &block)
      super(
        args.to_h.reverse_merge(
          dice_face: proxy_association.owner.next_rand,
          tick: proxy_association.owner.race_game.tick
        ), &block)
    end
  end

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
    self[:next_rand] || 1 + [1,1,2,2,2,3,3,4,4,5,6].sample
  end

  private

  def result_of_moves
    race_moves.each_with_object(
      Struct.new(:steps, :scars).new(0, old_scars)
    ) do |move, sum|
      sum.steps += [0, move.moves - sum.scars].max
      sum.scars += (move.super? ? 1 : 0)
    end
  end
end
