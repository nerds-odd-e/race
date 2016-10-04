require 'rails_helper'

RSpec.describe 'race_games/new', type: :view do
  before(:each) do
    assign(:race_game, RaceGame.new(
                         distance: 1
    ))
  end

  it 'renders new race_game form' do
    render

    assert_select 'form[action=?][method=?]', race_games_path, 'post' do
      assert_select 'input#race_game_distance[name=?]', 'race_game[distance]'
    end
  end
end
