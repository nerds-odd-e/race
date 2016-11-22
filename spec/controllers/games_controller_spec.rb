require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe 'big_screen' do
    it '' do
      get :big_screen
      expect(response).to render_template 'big_screen'
    end
  end
end
