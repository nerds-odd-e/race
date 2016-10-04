require 'rails_helper'

RSpec.describe 'race_games/index', type: :view do
  before(:each) do
    assign(:race_games, [
      RaceGame.create!(
        distance: 2
      ),
      RaceGame.create!(
        distance: 2
      )
    ])
  end

  it 'renders a list of race_games' do
    render
    assert_select 'tr>td', text: 2.to_s, count: 2
  end
end
