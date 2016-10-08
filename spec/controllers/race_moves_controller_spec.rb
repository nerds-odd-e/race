require 'rails_helper'

RSpec.describe RaceMovesController, type: :controller do
  let(:race_game) { FactoryGirl.create :race_game, tick: 1 }
  let(:race_player) { FactoryGirl.create :race_player, race_game: race_game }
  let(:valid_attributes) { { choice: 'normal' } }

  describe 'POST #create' do
    subject do
      post :create, params: {
        race_player_id: race_player,
        race_move: valid_attributes
      }
    end
    context 'with valid params' do
      it 'creates a new RaceMove' do
        expect { subject }.to change(RaceMove, :count).by(1)
      end

      it 'assigns a newly created race_move as @race_move' do
        subject
        expect(assigns(:race_move)).to be_a(RaceMove)
        expect(assigns(:race_move)).to be_persisted
      end

      it 'redirects to the created race_move' do
        is_expected.to redirect_to(race_player)
      end
    end

    context "when the game hasn't started yet" do
      before { race_game.update(tick: 0) }
      it { expect { subject }.not_to change(RaceMove, :count) }
      it { is_expected.to redirect_to(race_player) }

      it 'has error message' do
        subject
        expect(flash[:alert]).to eq 'Tick has not started yet'
      end
    end
  end
end
