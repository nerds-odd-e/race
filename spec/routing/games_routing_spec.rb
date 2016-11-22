require "rails_helper"

RSpec.describe GamesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/big_screen").to route_to("games#big_screen")
    end
  end
end
