require 'rails_helper'

RSpec.describe RacePlayersController, type: :controller do
  let(:race_game) { FactoryGirl.create :race_game }

  describe 'GET #show' do
    it 'assigns the requested race_player as @race_player' do
      race_player = FactoryGirl.create :race_player
      get :show, params: { id: race_player.to_param }
      expect(assigns(:race_player)).to eq(race_player)
    end
  end

  describe 'GET #new' do
    before { get :new, params: { race_game_id: race_game } }

    describe 'assigns a new race_player as @race_player' do
      subject { assigns(:race_player) }
      it { is_expected.to be_a(RacePlayer) }
      it { is_expected.to be_persisted }
      its(:race_game) { is_expected.to eq race_game }
    end

    it { is_expected.to redirect_to RacePlayer.last }
  end

  describe 'POST #create' do
    before { post :create, params: { race_game_id: race_game } }

    describe 'assigns a new race_player as @race_player' do
      subject { assigns(:race_player) }
      it { is_expected.to be_a(RacePlayer) }
      it { is_expected.to be_persisted }
      its(:race_game) { is_expected.to eq race_game }
    end

    it { is_expected.to redirect_to RacePlayer.last }
  end
end
