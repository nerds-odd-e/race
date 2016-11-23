class Player < ApplicationRecord
  validates :distance, presence: true

  def go_super(number)
    update(steps: number)
  end

  def go_random_super
    go_super(next_dice_number || Dice.number)
  end
end
