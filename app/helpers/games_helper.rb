# frozen_string_literal: true
module GamesHelper
  def car_image(player)
    image_tag 'car-scar0.png', class: "player_#{player.id}"
  end

  class PlayerDecorator
    delegate :id, :damage, :current_dice_number, :steps, :choice, :distance,
             to: :object
    attr_accessor :object

    def initialize(player, context)
      @object = player
      @context = context
    end

    def car_image
      style = "padding-left: #{distance * 10}px;"
      @context.image_tag 'car-scar0.png', class: "player_#{id}", style: style
    end
  end
end
