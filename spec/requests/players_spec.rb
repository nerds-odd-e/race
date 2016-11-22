require 'rails_helper'

RSpec.describe "Players", type: :request do
  describe "GET /players" do
    it "works! (now write some real specs)" do
      get players_path
      expect(response).to have_http_status(200)
    end

    it "shows select dice view" do
      put "/players/1/select_dice"
      expect(response).to have_http_status(302)
    end
  end
end
