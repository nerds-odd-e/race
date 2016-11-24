require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  before do
    FactoryGirl.create :game
  end
  describe 'big_screen' do
    it '' do
      get :big_screen
      expect(response).to render_template 'big_screen'
    end
    it 'shows no one moved' do
      get :big_screen
      expect(assigns(:game)).to eq Game.last
    end
  end
end
