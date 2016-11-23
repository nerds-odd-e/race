require 'rails_helper'

RSpec.describe PlayersController, type: :controller do
  let(:player) { FactoryGirl.create :player }

  let(:valid_attributes) {
    {
      'distance' => 10,
      'damage' => 0,
      'next_dice_number' => 3,
    }
  }

  let(:invalid_attributes) {
    {
      'distance' => nil,
      'damage' => 0,
      'next_dice_number' => 3
    }
  }

  let(:valid_session) { {} }

  describe "PUT #select_dice" do
    before { allow(Dice).to receive(:number) { 4 } }
    subject { put :select_dice, params: {id: player.to_param, choice: choice} }

    context 'go super' do
      let(:choice) { 'super' }
      it { is_expected.to redirect_to player_path(player, thrown: "thrown") }
      it { expect{ subject }.to change{player.reload.steps}.to 4 }
    end

    context 'go normal' do
      let(:choice) { 'normal' }
      it { expect{ subject }.to change{player.reload.steps}.to 2 }
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

    it "assigns the requested player as @player when thrown" do
      player = Player.create! valid_attributes
      get :show, params: {id: player.to_param, thrown: "thrown"}, session: valid_session
      expect(assigns(:player)).to eq(player)
    end

    it "after shown second views" do
      player = Player.create! valid_attributes
      get :show, params: {id: player.to_param, thrown: "thrown"}, session: valid_session
      expect(assigns(:thrown)).to be_truthy
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
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          'distance' => 10,
          'damage' => 0,
          'next_dice_number' => 3,
        }
      }

      it "updates the requested player" do
        player = Player.create! valid_attributes
        put :update, params: {id: player.to_param, player: new_attributes}, session: valid_session
        player.reload
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
