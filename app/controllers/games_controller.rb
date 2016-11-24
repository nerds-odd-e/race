class GamesController < ApplicationController
  def big_screen
    @game = Game.last
 end
end
