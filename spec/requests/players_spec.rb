require 'rails_helper'

RSpec.describe "Players", type: :request do
  describe "PUT /players/:id/select_dice" do
    it "shows select dice view" do
      player = FactoryGirl.create :player
      put select_dice_player_path(player.id)
      expect(response).to have_http_status(302)
    end
  end
end
