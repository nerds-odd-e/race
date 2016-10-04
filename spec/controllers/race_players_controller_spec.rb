require 'rails_helper'

RSpec.describe RacePlayersController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # RacePlayer. As you add validations to RacePlayer, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  let(:race_game) { FactoryGirl.create :race_game }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RacePlayersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #show' do
    it 'assigns the requested race_player as @race_player' do
      race_player = RacePlayer.create! valid_attributes
      get :show, params: { id: race_player.to_param }, session: valid_session
      expect(assigns(:race_player)).to eq(race_player)
    end
  end

  describe 'GET #new' do
    before { get :new, params: { race_game_id: race_game }, session: valid_session }

    describe 'assigns a new race_player as @race_player' do
      subject { assigns(:race_player) }
      it { is_expected.to be_a(RacePlayer) }
      it { is_expected.to be_persisted }
      its(:race_game) { is_expected.to eq race_game }
    end

    it { is_expected.to redirect_to RacePlayer.last }
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested race_player' do
        race_player = RacePlayer.create! valid_attributes
        put :update, params: { id: race_player.to_param, race_player: new_attributes }, session: valid_session
        race_player.reload
        skip('Add assertions for updated state')
      end

      it 'assigns the requested race_player as @race_player' do
        race_player = RacePlayer.create! valid_attributes
        put :update, params: { id: race_player.to_param, race_player: valid_attributes }, session: valid_session
        expect(assigns(:race_player)).to eq(race_player)
      end

      it 'redirects to the race_player' do
        race_player = RacePlayer.create! valid_attributes
        put :update, params: { id: race_player.to_param, race_player: valid_attributes }, session: valid_session
        expect(response).to redirect_to(race_player)
      end
    end

    context 'with invalid params' do
      it 'assigns the race_player as @race_player' do
        race_player = RacePlayer.create! valid_attributes
        put :update, params: { id: race_player.to_param, race_player: invalid_attributes }, session: valid_session
        expect(assigns(:race_player)).to eq(race_player)
      end

      it "re-renders the 'edit' template" do
        race_player = RacePlayer.create! valid_attributes
        put :update, params: { id: race_player.to_param, race_player: invalid_attributes }, session: valid_session
        expect(response).to render_template('edit')
      end
    end
  end
end
