Given(/^the organizer created a game$/) do
  visit new_race_game_url
  click_button 'Create'
end

When(/^a player join the game$/) do
  visit new_race_game_race_player_url(RaceGame.last)
  @player1 = RacePlayer.last
end

When(/^another player join the game$/) do
  visit new_race_game_race_player_url(RaceGame.last)
  @player2 = RacePlayer.last
end

Then(/^there should be two cars at the beginning line$/) do
  visit race_game_url RaceGame.last
  expect(page).to have_selector('.car', count: 2)
end

Given(/^a player's car has existing number of (\d+)$/) do |scars|
  step %(the organizer created a game)
  step %(a player join the game)
  @player1.update(old_scars: scars)
end

When(/^the organizer starts a new tick$/) do
  visit race_game_url RaceGame.last
  click_button 'Choose-First'
end

Then(/^he should be asked to choose if he want to go 'normal' or 'super'$/) do
end

When(/^he makes a (.*?) and the dice show (\d+)$/) do |choice, number|
  @player1.update(next_rand: number)
  visit race_player_url @player1
  click_button choice
end


Then(/^the player's car should be at the beginning line with (\d+) damage$/) do |scars|
  step("his car should go 0 with #{scars} on it")
end

Then(/^his car should go (\d+) with (\d+) on it$/) do |steps, scars|
  visit race_game_url RaceGame.last
  within(:xpath, "//li[@id='car#{@player1.index}']") do
    expect(page).to have_selector('.index', text: @player1.index)
    expect(page).to have_selector('.steps', text: steps)
    expect(page).to have_selector('.scars', text: scars)
  end
end
