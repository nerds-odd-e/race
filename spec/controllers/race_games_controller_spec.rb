require 'rails_helper'

RSpec.describe RaceGamesController, type: :controller do
  let(:race_game) { FactoryGirl.create :race_game }
  describe 'GET #index' do
    it 'assigns all race_games as @race_games' do
      race_game
      get :index, params: {}
      expect(assigns(:race_games)).to eq([race_game])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested race_game as @race_game' do
      get :show, params: { id: race_game.to_param }
      expect(assigns(:race_game)).to eq(race_game)
    end
  end

  describe 'GET #new' do
    it 'assigns a new race_game as @race_game' do
      get :new, params: {}
      expect(assigns(:race_game)).to be_a_new(RaceGame)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      subject do
        post :create, params: {
          race_game: FactoryGirl.attributes_for(:race_game)
        }
      end

      it 'creates a new RaceGame' do
        expect do
          subject
        end.to change(RaceGame, :count).by(1)
      end

      it 'assigns a newly created race_game as @race_game' do
        subject
        expect(assigns(:race_game)).to be_a(RaceGame)
        expect(assigns(:race_game)).to be_persisted
      end

      it 'redirects to the created race_game' do
        expect(subject).to redirect_to(RaceGame.last)
      end
    end
  end

  describe 'qr_code' do
    subject { get :qr_code, params: { id: race_game.to_param } }

    its(:content_type) { is_expected.to eq 'image/svg+xml' }

    describe 'interaction with qrcode library' do
      let(:qrcode) { double('qrcode') }
      before { allow(RQRCode::QRCode).to receive(:new) { qrcode } }
      before { allow(qrcode).to receive(:as_svg) { 'an svg image' } }

      it 'should generate the qr code' do
        expect(RQRCode::QRCode).to receive(:new).with(
          new_race_game_race_player_url(race_game))
        subject
      end

      it 'should send the qr code' do
        expect(controller).to receive(:send_data).with(
          'an svg image', anything) { controller.head :ok }
        subject
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
