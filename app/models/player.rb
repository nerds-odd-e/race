class Player < ApplicationRecord
  validates :distance, presence: true

  def go_super(number)
    self.steps = number
  end

end
