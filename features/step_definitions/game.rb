# frozen_string_literal: true
Given(/^There is a new game$/) do
end

Given(/^The player join the game$/) do
  visit new_player_url
  click_on '参加'
end

Given(/^View has no dice result$/) do
  page.should have_no_content 'Dice'
  page.should have_no_content 'Step'
  page.should have_no_content 'Last Choice'
  page.should have_no_content 'Distance'
end

Given(/^The player has (\d+) damage$/) do |damage|
  @current_player = Player.last
  @current_player.damage = damage
end

When(/^The player goes (\w+) and the dice show (\d+)$/) do |choice, next_dice_number|
  @current_player.update(next_dice_number: next_dice_number)
  click_on choice
end

Then(/^The car move (\d+) steps and has (\d+) damage$/) do |number_of_steps, updated_damage|
  page.should have_selector '.steps', text: number_of_steps
  page.should have_selector '.dice', text: @current_player.current_dice_number
  page.should have_selector '.damage', text: updated_damage
end

Then(/^The car distance display (\d+)$/) do |distance|
  page.should have_selector '.distance', text: distance
end

Given(/^join (\d+) players$/) do |join_players|
  join_players.to_i.times do
    visit new_player_url
    click_on '参加'
  end
  FactoryGirl.create(:game, total: join_players)
end

Given(/^thrown (\d+) players$/) do |thrown_players|
  Player.limit(thrown_players).each do |player|
    visit player_url(player)
    click_on 'Normal'
  end
end

Given(/^new (\d+) players$/) do |new_players|
  FactoryGirl.create_list(:player, new_players.to_i)
end

When(/^Admin press next button$/) do
  visit '/big_screen'
  click_on 'Next'
end

Then(/^Moved players number is (\d+)$/) do |moved_players|
  visit '/big_screen'
  page.should have_selector '.moved', text: moved_players
end

Then(/^The player's choice\((\w+)\) is shown on player view$/) do |choice|
  page.should have_selector '.choice', text: choice
end
