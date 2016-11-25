# frozen_string_literal: true
class GamesController < ApplicationController
  def big_screen
    @game = Game.start
  end
end
