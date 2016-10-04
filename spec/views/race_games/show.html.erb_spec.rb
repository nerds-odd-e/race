require 'rails_helper'

RSpec.describe "race_games/show", type: :view do
  before(:each) do
    @race_game = assign(:race_game, RaceGame.create!(
      :distance => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
  end
end
