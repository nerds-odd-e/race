# frozen_string_literal: true
When(/^View the big screen$/) do
  visit '/big_screen'
end

Then(/^All player's cars are shown in big screen$/) do
  Player.all.each do |player|
    page.should have_selector "img[class='player_#{player.id}']"
  end
end
