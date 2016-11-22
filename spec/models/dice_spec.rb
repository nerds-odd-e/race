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
      expect(@dice.calc_normal_step(1)).to eq 1
    end

    it 'dice is 4 return 2' do
      expect(@dice.calc_normal_step(4)).to eq 2
    end
  end

  describe 'supcer dice' do
    it 'super dice is 3 return 3' do
      expect(@dice.calc_super_step(3)).to eq 3
    end

    it 'super dice is 5 return 5' do
      expect(@dice.calc_super_step(5)).to eq 5
    end
  end

  describe 'get_step_num' do
    it 'step is 2 and damage 1 return 1' do
      expect(@dice.get_step_num(2,1)).to eq 1
    end

    it 'step is 5 and damage 1 return 4' do
      expect(@dice.get_step_num(5, 1)).to eq 4
    end

    it 'step is 2 and damage 4 return 0' do
      expect(@dice.get_step_num(2, 4)).to eq 0
    end

  end
end
