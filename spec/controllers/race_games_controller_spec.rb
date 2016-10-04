require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

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

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested race_game' do
        race_game = RaceGame.create! valid_attributes
        put :update, params: { id: race_game.to_param, race_game: new_attributes }, session: valid_session
        race_game.reload
        skip('Add assertions for updated state')
      end

      it 'assigns the requested race_game as @race_game' do
        race_game = RaceGame.create! valid_attributes
        put :update, params: { id: race_game.to_param, race_game: valid_attributes }, session: valid_session
        expect(assigns(:race_game)).to eq(race_game)
      end

      it 'redirects to the race_game' do
        race_game = RaceGame.create! valid_attributes
        put :update, params: { id: race_game.to_param, race_game: valid_attributes }, session: valid_session
        expect(response).to redirect_to(race_game)
      end
    end

    context 'with invalid params' do
      it 'assigns the race_game as @race_game' do
        race_game = RaceGame.create! valid_attributes
        put :update, params: { id: race_game.to_param, race_game: invalid_attributes }, session: valid_session
        expect(assigns(:race_game)).to eq(race_game)
      end

      it "re-renders the 'edit' template" do
        race_game = RaceGame.create! valid_attributes
        put :update, params: { id: race_game.to_param, race_game: invalid_attributes }, session: valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested race_game' do
      race_game = RaceGame.create! valid_attributes
      expect do
        delete :destroy, params: { id: race_game.to_param }, session: valid_session
      end.to change(RaceGame, :count).by(-1)
    end

    it 'redirects to the race_games list' do
      race_game = RaceGame.create! valid_attributes
      delete :destroy, params: { id: race_game.to_param }, session: valid_session
      expect(response).to redirect_to(race_games_url)
    end
  end
end
