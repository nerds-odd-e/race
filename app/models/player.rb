class Player < ApplicationRecord
  validates :distance, presence: true

  def go_super(number)
    go(number)
    self.damage += 1
    self.choice = "Super"
  end

  def go_random_super
    go_super(dice_number)
  end

  def go_normal(number)
    go(number.odd? ? 1 : 2)
    self.choice = "Normal"
  end

  def go_random_normal
    go_normal(dice_number)
  end

  def dice_number
    next_dice_number || Dice.number
  end

  private

  def go(number)
    self.steps = [number - damage, 0].max
    self.distance += steps
    self.current_dice_number = number
  end

end
