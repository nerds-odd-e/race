require 'rails_helper'

RSpec.describe RacePlayer, type: :model do
  let(:race_game) { FactoryGirl.create :race_game }
  subject { RacePlayer.create race_game: race_game }

  its(:index) {is_expected.to eq 1}

  context 'given I set the next rand number to be 3' do
    before { subject.next_rand = 3 }
    its(:dice_face) { is_expected.to eq 3 }
  end
end
