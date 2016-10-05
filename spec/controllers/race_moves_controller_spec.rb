require 'rails_helper'

RSpec.describe RaceMovesController, type: :controller do
  let(:race_player) { FactoryGirl.create :race_player }
  let(:valid_attributes) { {choice: 'normal'} }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RaceMovesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "POST #create" do
    context "with valid params" do
        subject { post :create, params: {race_player_id: race_player, race_move: valid_attributes}, session: valid_session }

      it "creates a new RaceMove" do
        expect { subject }.to change(RaceMove, :count).by(1)
      end

      it "assigns a newly created race_move as @race_move" do
        subject
        expect(assigns(:race_move)).to be_a(RaceMove)
        expect(assigns(:race_move)).to be_persisted
      end

      it "redirects to the created race_move" do
        is_expected.to redirect_to(race_player)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved race_move as @race_move" do
        post :create, params: {race_move: invalid_attributes}, session: valid_session
        expect(assigns(:race_move)).to be_a_new(RaceMove)
      end

      it "re-renders the 'new' template" do
        post :create, params: {race_move: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

end
