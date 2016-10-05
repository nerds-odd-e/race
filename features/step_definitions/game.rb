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

Given(/^a player is in the game \(he\)$/) do
  step %(the organizer created a game)
  step %(a player join the game)
end

Given(/^another player is in the game \(she\)$/) do
  step('another player join the game')
end

Then(/^there should be two cars at the beginning line$/) do
  visit race_game_url RaceGame.last
  expect(page).to have_selector('.car', count: 2)
end

Given(/^a player's car has existing number of (\d+) scars$/) do |scars|
  step %(the organizer created a game)
  step %(a player join the game)
  @player1.update(old_scars: scars)
end

When(/^the organizer starts a new tick$/) do
  visit race_game_url RaceGame.last
  click_button 'Choose-First'
end

Then(/^he should not be able to move( again)?$/) do |again|
  visit race_player_url @player1
  click_button 'normal'
  if again
    expect(page).to have_selector('#alert', text: 'Tick already moved')
  else
    expect(page).to have_selector('#alert', text: 'Tick has not started')
  end
end

def player_makes_a_move(player, choice, number)
  player.update(next_rand: number)
  visit race_player_url player
  click_button choice
  expect(page).to have_selector(".dice-face .dice-face#{number}", text: number)
end


Then(/^he can make a move( again)?$/) do |again|
  player_makes_a_move(@player1, 'normal', 1)
  expect(page).to have_selector('#notice', text: 'You just made the move')
end

Then(/^she can make a move$/) do
  player_makes_a_move(@player2, 'normal', 2)
end

Then(/^he should be asked to choose if he want to go 'normal' or 'super'$/) do
  visit race_player_url @player1
  expect(page).to have_selector('.dice-face', text: '')
end

When(/^he makes a (.*?) and the dice show (\d+)$/) do |choice, number|
  player_makes_a_move(@player1, choice, number)
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
