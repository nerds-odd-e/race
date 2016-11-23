class Player < ApplicationRecord
  validates :distance, presence: true

  def go_super(number)
    update(steps: number)
  end

  def go_random_super
    go_super(dice_number)
  end

  def go_normal(number)
    update(steps: number.odd? ? 1 : 2)
  end

  def go_random_normal
    go_normal(dice_number)
  end

  def damage
    0
  end

  def dice_number
    next_dice_number || Dice.number
  end
end
