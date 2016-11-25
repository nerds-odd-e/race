class Player < ApplicationRecord
  validates :distance, presence: true

  scope :thrown, -> { where(throw_flag: true) }

  def go_super(number)
    go(number, number)
    self.damage += 1
    self.choice = "Super"
  end

  def go_random_super
    go_super(dice_number)
  end

  def go_normal(number)
    go(number, number.odd? ? 1 : 2)
    self.choice = "Normal"
  end

  def go_random_normal
    go_normal(dice_number)
  end

  def dice_number
    next_dice_number || Dice.number
  end

  private

  def go(number, step)
    self.steps = [step - damage, 0].max
    self.distance += steps
    self.current_dice_number = number
    self.throw_flag = true
  end

end
