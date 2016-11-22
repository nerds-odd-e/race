require 'rails_helper'

RSpec.describe "players/new", type: :view do
  before(:each) do
    assign(:player, Player.new())
  end

  it "renders new player form" do
    render

    assert_select "form[action=?][method=?]", players_path, "post" do
    end
  end
end
