require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'check_move_flag' do
    before do
      @game = Game.new
    end
    it 'total 2 and thrown_players 2' do
      check_flag = @game.check_move_flag(2,2)
      expect(check_flag).to be_truthy
    end

    it 'total 2 and thrown_players 1' do
      check_flag = @game.check_move_flag(2,1)
      expect(check_flag).to be_falsey
    end

    it 'return true becase has new player' do
      @game.total = 1
      @game.save
      FactoryGirl.create_list(:player, 2)
      check_flag = @game.check_move_flag(1,0)
      expect(check_flag).to be_truthy
    end

  end
end
