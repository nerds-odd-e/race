require 'rails_helper'

RSpec.describe Dice, type: :model do
  before do
    @dice = Dice.new
  end
  describe 'number' do
    it 'get dise number' do
      number = Dice.number
      expect([1, 2, 3, 4, 5, 6]).to include number
    end
  end
end
