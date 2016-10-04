require 'rails_helper'

RSpec.describe 'race_games/edit', type: :view do
  before(:each) do
    @race_game = assign(:race_game, RaceGame.create!(
                                      distance: 1
    ))
  end

  it 'renders the edit race_game form' do
    render

    assert_select 'form[action=?][method=?]', race_game_path(@race_game), 'post' do
      assert_select 'input#race_game_distance[name=?]', 'race_game[distance]'
    end
  end
end
