require 'rails_helper'

RSpec.describe PlayersController, type: :controller do
  let(:player) { FactoryGirl.create :player }

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

  describe "GET #show" do
    subject{ get :show, params: {id: player.to_param} }
    it "assigns the requested player as @player" do
      subject
      expect(assigns(:player)).to eq(player)
    end

    it "assigns the requested player as @player when thrown" do
      subject
      expect(assigns(:player)).to eq(player)
    end

    it "after shown second views" do
      get :show, params: {id: player.to_param, thrown: "thrown"}
      expect(assigns(:thrown)).to be_truthy
    end
  end

  describe "GET #new" do
    it "assigns a new player as @player" do
      get :new
      expect(assigns(:player)).to be_a_new(Player)
    end
  end

  describe "POST #create" do
    subject { post :create }
    it { expect { subject }.to change(Player, :count).by(1) }
    it { is_expected.to redirect_to(Player.last) }

    it "assigns a newly created player as @player" do
      subject
      expect(assigns(:player)).to be_a(Player)
      expect(assigns(:player)).to be_persisted
    end
  end

end
