Given(/^There is a new game$/) do
end

Given(/^The player join the game$/) do
  visit new_player_url
  click_on "参加"
end

When(/^The player goes (\w+) and the dice show (\d+)$/) do |choice, next_dice_number|
  @current_player = Player.last
  @current_player.update(next_dice_number: next_dice_number)
  click_on choice
end

Then(/^The car move (\d+) steps and has (\d+) damage$/) do |arg1, arg2|
end

Then(/^(\d+) \+ (\d+) should be (\d+)$/) do |arg1, arg2, arg3|
end

Given(/^The player has (\d+) damage$/) do |arg1|
end

Given(/^The player joined the game$/) do
end

When(/^The player goes super$/) do
end

 When(/^The player status are$/) do |table|
   table_raw = table.raw
   table_raw.delete_at(0)

   table_raw.each do |row|
     step "The car move #{row[0]} steps and has #{row[1]} damage"
   end
 end
