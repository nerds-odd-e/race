require 'rails_helper'

RSpec.describe Player, type: :model do
  describe "#steps" do
    subject { FactoryGirl.create :player }

    its(:steps) { is_expected.to eq 0 }

    [
      [1, :go_super, 1],
      [2, :go_super, 2],
      [3, :go_super, 3],
      [4, :go_super, 4],
      [5, :go_super, 5],
      [6, :go_super, 6],
      [1, :go_normal, 1],
      [2, :go_normal, 2],
      [3, :go_normal, 1],
      [4, :go_normal, 2],
      [5, :go_normal, 1],
      [6, :go_normal, 2]
    ].each do |number, method, expected_steps|
      context "when the player #{method} with #{number}" do
        before { subject.send(method, number) }
        its(:steps) { is_expected.to eq expected_steps }
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

  describe '#update_steps' do
    it 'update result steps to move' do
      player = FactoryGirl.create :player, {steps: 2, damage: 1}
      player.update_steps
      expect(player.steps).to eq 1
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
