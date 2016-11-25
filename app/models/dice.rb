# frozen_string_literal: true
class Dice
  MAX_NUM = 6

  def self.number
    rand(MAX_NUM) + 1
  end
end
