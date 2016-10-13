require 'rails_helper'

RSpec.describe RaceGame, type: :model do
  subject { FactoryGirl.create :race_game, tick: 1 }

  before do
    (1..4).each do |steps|
      player = RacePlayer.create race_game: subject
      RaceMove.create! race_player: player, dice_face: steps, choice: 'super'
    end
  end

  it 'sort the player' do
    expect(subject.sorted_players.first.steps).to eq 4
  end
end
