class Player < ApplicationRecord
  validates :distance, presence: true

  def go_super(number)
    self.distance = number
    self.steps = number - damage
    self.damage += 1
    self.current_dice_number = number
  end

  def go_random_super
    go_super(dice_number)
  end

  def go_normal(number)
    self.steps = (number.odd? ? 1 : 2) - damage
    self.distance += steps
    self.current_dice_number = number
  end

  def go_random_normal
    go_normal(dice_number)
  end

  def dice_number
    next_dice_number || Dice.number
  end
end
