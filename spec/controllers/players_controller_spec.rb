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

RSpec.describe PlayersController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Player. As you add validations to Player, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PlayersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "PUT #select_dice" do
    it "render show screen" do
      put :select_dice, params: {id:1}, session: valid_session
      expect(response).to redirect_to '/players/1'
    end
  end

  describe "GET #index" do
    it "assigns all players as @players" do
      player = Player.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:players)).to eq([player])
    end
  end

  describe "GET #show" do
    it "assigns the requested player as @player" do
      player = Player.create! valid_attributes
      get :show, params: {id: player.to_param}, session: valid_session
      expect(assigns(:player)).to eq(player)
    end
  end

  describe "GET #new" do
    it "assigns a new player as @player" do
      get :new, params: {}, session: valid_session
      expect(assigns(:player)).to be_a_new(Player)
    end
  end

  describe "GET #edit" do
    it "assigns the requested player as @player" do
      player = Player.create! valid_attributes
      get :edit, params: {id: player.to_param}, session: valid_session
      expect(assigns(:player)).to eq(player)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Player" do
        expect {
          post :create, params: {player: valid_attributes}, session: valid_session
        }.to change(Player, :count).by(1)
      end

      it "assigns a newly created player as @player" do
        post :create, params: {player: valid_attributes}, session: valid_session
        expect(assigns(:player)).to be_a(Player)
        expect(assigns(:player)).to be_persisted
      end

      it "redirects to the created player" do
        post :create, params: {player: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Player.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved player as @player" do
        post :create, params: {player: invalid_attributes}, session: valid_session
        expect(assigns(:player)).to be_a_new(Player)
      end

      it "re-renders the 'new' template" do
        post :create, params: {player: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested player" do
        player = Player.create! valid_attributes
        put :update, params: {id: player.to_param, player: new_attributes}, session: valid_session
        player.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested player as @player" do
        player = Player.create! valid_attributes
        put :update, params: {id: player.to_param, player: valid_attributes}, session: valid_session
        expect(assigns(:player)).to eq(player)
      end

      it "redirects to the player" do
        player = Player.create! valid_attributes
        put :update, params: {id: player.to_param, player: valid_attributes}, session: valid_session
        expect(response).to redirect_to(player)
      end
    end

    context "with invalid params" do
      it "assigns the player as @player" do
        player = Player.create! valid_attributes
        put :update, params: {id: player.to_param, player: invalid_attributes}, session: valid_session
        expect(assigns(:player)).to eq(player)
      end

      it "re-renders the 'edit' template" do
        player = Player.create! valid_attributes
        put :update, params: {id: player.to_param, player: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested player" do
      player = Player.create! valid_attributes
      expect {
        delete :destroy, params: {id: player.to_param}, session: valid_session
      }.to change(Player, :count).by(-1)
    end

    it "redirects to the players list" do
      player = Player.create! valid_attributes
      delete :destroy, params: {id: player.to_param}, session: valid_session
      expect(response).to redirect_to(players_url)
    end
  end

end
