class GamesController < ApplicationController
  def big_screen
    @moved = Player.where(throw_flag: true).count  
    if Game.new.is_move_next?(@moved)
      @moved = 0
    end
  end
end
