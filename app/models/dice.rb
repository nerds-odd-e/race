class Dice
  MAX_NUM = 6

  def get_number
    return rand(MAX_NUM) + 1
  end

  def calc_normal_step(dice)
    if dice.odd?
      return 1
    else
      return 2
    end
  end
end
