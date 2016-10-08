require 'rails_helper'

RSpec.describe RaceGamesController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # RaceGame. As you add validations to RaceGame, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RaceGamesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all race_games as @race_games' do
      race_game = RaceGame.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:race_games)).to eq([race_game])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested race_game as @race_game' do
      race_game = RaceGame.create! valid_attributes
      get :show, params: { id: race_game.to_param }, session: valid_session
      expect(assigns(:race_game)).to eq(race_game)
    end
  end

  describe 'GET #new' do
    it 'assigns a new race_game as @race_game' do
      get :new, params: {}, session: valid_session
      expect(assigns(:race_game)).to be_a_new(RaceGame)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested race_game as @race_game' do
      race_game = RaceGame.create! valid_attributes
      get :edit, params: { id: race_game.to_param }, session: valid_session
      expect(assigns(:race_game)).to eq(race_game)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new RaceGame' do
        expect do
          post :create, params: { race_game: valid_attributes }, session: valid_session
        end.to change(RaceGame, :count).by(1)
      end

      it 'assigns a newly created race_game as @race_game' do
        post :create, params: { race_game: valid_attributes }, session: valid_session
        expect(assigns(:race_game)).to be_a(RaceGame)
        expect(assigns(:race_game)).to be_persisted
      end

      it 'redirects to the created race_game' do
        post :create, params: { race_game: valid_attributes }, session: valid_session
        expect(response).to redirect_to(RaceGame.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved race_game as @race_game' do
        post :create, params: { race_game: invalid_attributes }, session: valid_session
        expect(assigns(:race_game)).to be_a_new(RaceGame)
      end

      it "re-renders the 'new' template" do
        post :create, params: { race_game: invalid_attributes }, session: valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'choose first' do
    let(:race_game) { FactoryGirl.create :race_game }
    subject { post :choose_first, params: { id: race_game.to_param } }
    context 'with valid params' do
      it 'updates the requested race_game' do
        expect { subject }.to change { race_game.reload.tick }.by(1)
      end

      it { is_expected.to redirect_to race_game }
    end
  end
end
