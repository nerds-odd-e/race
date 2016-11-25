# frozen_string_literal: true
require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe 'big_screen' do
    context 'new game' do
      before do
        FactoryGirl.create :game
      end
      it '' do
        get :big_screen
        expect(response).to render_template 'big_screen'
      end
      it 'shows no one moved' do
        get :big_screen
        expect(assigns(:game)).to eq Game.start
      end
    end
  end
end
