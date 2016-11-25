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
