class Dice
  MAX_NUM = 6

  def self.number
    return rand(MAX_NUM) + 1
  end

  def get_step_num(dice, damage)
    steps = dice - damage
    if steps < 0
      return 0
    else
      return steps
    end
  end
end
