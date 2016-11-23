class Player < ApplicationRecord
  validates :distance, presence: true

  def go_super(number)
    update(steps: number)
  end

end
