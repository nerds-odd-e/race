class GamesController < ApplicationController
  def big_screen
    @moved = Player.where(throw_flag: true).count  
  end
end
