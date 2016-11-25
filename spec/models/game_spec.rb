# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Game, type: :model do
  subject { Game.start }
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

  describe '#total_player_count' do
    [2, 3].each do |join_players|
      context "There are #{join_players} players" do
        before { FactoryGirl.create_list(:player, join_players) }
        its(:total_player_count) { is_expected.to eq join_players }
      end
    end
  end

  describe '#start' do
    it 'get game data' do
      expect(Game.start).to eq Game.last
    end
  end
end
