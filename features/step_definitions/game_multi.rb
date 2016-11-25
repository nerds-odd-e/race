# frozen_string_literal: true
When(/^View the big screen$/) do
  visit '/big_screen'
end

Then(/^All player's cars are shown in big screen$/) do
  Player.all.each do |player|
    car_image_name = "car-scar#{player.damage}"
    page.find(".player_#{player.id}")['src'].should match(/#{car_image_name}/)
  end
end

Given(/^There are (\d+) players in the game$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^the first player throws the dice$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the first car is moved$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the second car is not moved$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^the second player throws the dice$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the second car is moved$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^There's one player in the game$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^the player throws the dice$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the player's car is moved$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^the player throws the dice again$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the player's car is not moved$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^there's a message saying "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^the admin clicks "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
