require 'rails_helper'

RSpec.describe RacePlayer, type: :model do
  let(:race_game) { FactoryGirl.create :race_game }
  subject { RacePlayer.create race_game: race_game }

  its(:index) {is_expected.to eq 1}
end
