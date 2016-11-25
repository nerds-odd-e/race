# frozen_string_literal: true
class GamesController < ApplicationController
  def big_screen
    @game = Game.start
  end

  def next
    Player.refresh_thrown
    redirect_to big_screen_path
  end
end
