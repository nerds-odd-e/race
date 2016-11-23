class Dice
  MAX_NUM = 6

  def self.number
    return rand(MAX_NUM) + 1
  end
end
