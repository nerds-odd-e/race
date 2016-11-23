class Player < ApplicationRecord
  validates :distance, presence: true

  def go_super(number)
    update(distance: number - 1)
    update(steps: number, damage: damage + 1)
  end

  def go_random_super
    go_super(dice_number)
  end

  def go_normal(number)
    update(steps: number.odd? ? 1 : 2)
    update(distance: steps - 1)
  end

  def go_random_normal
    go_normal(dice_number)
  end

  def dice_number
    current_dice_number = next_dice_number || Dice.number
    update(current_dice_number: current_dice_number)
    current_dice_number
  end
end
