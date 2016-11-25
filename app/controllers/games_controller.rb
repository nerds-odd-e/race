class GamesController < ApplicationController
  def big_screen
    @game = Game.start
  end

  def next
   redirect_to 'big_screen'
  end
end
