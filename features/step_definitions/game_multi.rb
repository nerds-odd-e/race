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

Given(/^There are (\d+) players in the game$/) do |players|
  players.to_i.times do
    visit new_player_url
    click_on '参加'
  end
end

When(/^the first player throws the dice$/) do
  visit "/players/#{Player.first.id}"
  click_on 'Normal'
end

Then(/^the first car is moved$/) do
  visit '/big_screen'
  player = Player.first
  id = player.id
  distance = player.distance
  style = "padding-left: #{distance * 10}px;"
  page.find(".player_#{id}")['style'].should == style
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

Then(/^there's a message saying "already moved"$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^the admin clicks "next"$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
