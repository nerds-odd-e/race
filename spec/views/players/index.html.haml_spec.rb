require 'rails_helper'

RSpec.describe "players/index", type: :view do
  before(:each) do
    assign(:players, [
      Player.create!(),
      Player.create!()
    ])
  end

  it "renders a list of players" do
    render
  end
end
