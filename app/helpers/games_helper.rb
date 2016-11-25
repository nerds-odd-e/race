# frozen_string_literal: true
module GamesHelper
  def car_image(player)
    image_tag 'car-scar0.png', class: "player_#{player.id}"
  end
end
