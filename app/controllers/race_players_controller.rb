class RacePlayersController < ApplicationController # :nodoc:
  before_action :set_race_player, only: [:show, :edit, :update, :destroy]
  before_action :set_race_game, only: [:new, :create]

  # GET /race_players/1
  # GET /race_players/1.json
  def show
  end

  def create
    @race_player = RacePlayer.create race_game: @race_game
    redirect_to @race_player
  end

  def new
    create
  end

  private

  def set_race_player
    @race_player = RacePlayer.find(params[:id])
  end

  def set_race_game
    @race_game = RaceGame.find(params[:race_game_id])
  end

  def race_player_params
    params.fetch(:race_player, {})
  end
end
