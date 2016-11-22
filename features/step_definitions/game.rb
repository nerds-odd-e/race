Given(/^There is a new game$/) do
end

Given(/^The player join the game$/) do
end

When(/^The player goes normal$/) do
end

When(/^The dice show (\d+)$/) do |arg1|
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

# When(/^The player status are$/) do |table|
#   table_raw = table.raw
#   table_raw.delete_at(0)
#
#   table_raw.each do |row|
#     step "The car move #{row[0]} steps and has #{row[1]} damage"
#   end
# end
