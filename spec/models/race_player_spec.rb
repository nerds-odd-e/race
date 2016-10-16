require 'rails_helper'

RSpec.describe RacePlayer, type: :model do
  let(:race_game) { FactoryGirl.create :race_game }
  subject { RacePlayer.create race_game: race_game }

  its(:index) { is_expected.to eq 1 }
  its(:scars) { is_expected.to eq 0 }
  context 'given there are old scars' do
    before { subject.old_scars = 5 }
    its(:scars) { is_expected.to eq 5 }
  end

  context 'given I set the next rand number to be 3' do
    before { subject.next_rand = 3 }
    its(:dice_face) { is_expected.to be_nil }

    context 'when makes the next move' do
      before { subject.race_moves.create({}) }
      its(:dice_face) { is_expected.to eq 3 }
    end
  end
end
