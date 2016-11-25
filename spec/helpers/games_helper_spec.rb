# frozen_string_literal: true
require 'rails_helper'

RSpec.describe GamesHelper, type: :helper do
  describe 'views car image' do
    it 'return image tag for views car' do
      player = FactoryGirl::create :player
      expect(car_image(player)).to match 'car-scar0.png'
    end
  end

end
