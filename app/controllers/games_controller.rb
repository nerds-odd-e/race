class GamesController < ApplicationController
  def big_screen
    @game = Game.start
  end
end
