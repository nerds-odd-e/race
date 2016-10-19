require 'rails_helper'

RSpec.describe RaceGame, type: :model do
  subject { FactoryGirl.create :race_game, tick: 1 }

  before do
    (1..4).each do |steps|
      player = RacePlayer.create race_game: subject
      player.race_moves.create(dice_face: steps, choice: 'super')
    end
  end
end
