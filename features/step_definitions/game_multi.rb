# frozen_string_literal: true
When(/^View the big screen$/) do
  visit '/big_screen'
end

Then(/^All player's cars are shown in big screen$/) do
  Player.count.times do |i|
    page.should have_selector ".player_#{i}", text: '■'
  end
end
