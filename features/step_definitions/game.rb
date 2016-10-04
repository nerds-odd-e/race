Given(/^the organizer created a game$/) do
  visit new_race_game_url
  click_button 'Create'
end

When(/^a player join the game$/) do
  visit new_race_game_race_player_url(RaceGame.last)
  @player1 = RacePlayer.last
end

Then(/^the player's car should be at the beginning line with (\d+) damage$/) do |scars|
  visit race_game_url RaceGame.last
  within(:xpath, "//li[@id='car#{@player1.index}']") do
    expect(page).to have_selector('.index', text: @player1.index)
    expect(page).to have_selector('.scars', text: scars)
  end
end
