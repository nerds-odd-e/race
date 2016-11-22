Given(/^There is a new game$/) do
end

Given(/^The player join the game$/) do
  visit new_player_url
  click_on "参加"
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
  page.should have_content(number_of_steps)
  expect(updated_damage.to_i).to eq @current_player.damage
end

Given(/^join (\d+) players$/) do |join_players|
  FactoryGirl.create_list(:player, join_players.to_i)
  FactoryGirl.create(:game, {total: join_players})
end

Given(/^thrown (\d+) players$/) do |thrown_players|
  Player.limit(thrown_players).update_all(throw_flag: true)
end

Given(/^new (\d+) players$/) do |new_players|
  FactoryGirl.create_list(:player, new_players.to_i)
end

When(/^Admin press next button$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^Moved players number is (\d+)$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
