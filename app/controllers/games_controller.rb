# frozen_string_literal: true
class GamesController < ApplicationController
  def big_screen
    @game = Game.start
    @players = Player.all.collect {|p| ::GamesHelper::PlayerDecorator.new(p, view_context()) }
  end

  def next
    Player.refresh_thrown
    redirect_to big_screen_path
  end
end
