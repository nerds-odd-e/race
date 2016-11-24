require 'rails_helper'

RSpec.describe Player, type: :model do
  describe "#steps" do
    subject { FactoryGirl.create :player }

    its(:steps) { is_expected.to eq 0 }

    [
      [1, :go_super, 1, 1, 0],
      [2, :go_super, 2, 2, 0],
      [3, :go_super, 3, 3, 0],
      [4, :go_super, 4, 4, 0],
      [5, :go_super, 5, 5, 0],
      [6, :go_super, 6, 6, 0],
      [1, :go_normal, 1, 1, 0],
      [2, :go_normal, 2, 2, 0],
      [3, :go_normal, 1, 1, 0],
      [4, :go_normal, 2, 2, 0],
      [5, :go_normal, 1, 1, 0],
      [6, :go_normal, 2, 2, 0],
      [2, :go_normal, 1, 1, 1]
    ].each do |number, method, expected_steps, expected_distance, existing_damage|
      context "when the player #{method} with #{number} and #{existing_damage} damages" do
        before {
           subject.damage = existing_damage
           subject.send(method, number)
         }
        its(:steps) { is_expected.to eq expected_steps }
        its(:distance) { is_expected.to eq expected_distance }
      end
    end
  end

  describe '#go_super' do
    its(:damage) { is_expected.to eq 0 }
    context 'when go super' do
      before { subject.go_super 3 }
      its(:damage) { is_expected.to eq 1 }
    end
  end

  describe '#dice_number' do
    it '' do
      player = FactoryGirl.create :player
      player.dice_number
      expect([1, 2, 3, 4, 5, 6]).to include player.current_dice_number
    end
  end
end
