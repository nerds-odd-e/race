require 'rails_helper'

RSpec.describe Game, type: :model do
  subject { Game.new }
  describe '#moved_player_count' do
    context 'There are 2 players' do
      before { FactoryGirl.create_list(:player, 2) }
      its(:moved_player_count) { is_expected.to eq 0 }
      context 'moved one player' do
        before { Player.last.update(throw_flag: true) }
        its(:moved_player_count) { is_expected.to eq 1 }
      end
    end
  end

end
