require 'rails_helper'

RSpec.describe Dice, type: :model do
  before do
    @dice = Dice.new
  end
  describe 'get_number' do
    it 'get dise number' do
      number = @dice.get_number
      expect([1, 2, 3, 4, 5, 6]).to include number
    end
  end

  describe 'calc_normal_step' do
    it 'dice is 1 return 1' do
      step = @dice.calc_normal_step(1)
      expect(step).to eq 1
    end

    it 'dice is 4 return 2' do
      step = @dice.calc_normal_step(4)
      expect(step).to eq 2
    end
  end
end
