# frozen_string_literal: true
class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :select_dice]

  NORMAL = 'normal'

  def select_dice
    if params[:choice] == NORMAL
      @player.go_random_normal
    else
      @player.go_random_super
    end

    @player.save

    redirect_to player_path(@player, thrown: 'thrown')
  end

  # GET /players/1
  def show
    @thrown = params[:thrown].present?
  end

  # GET /players/new
  def new
    @player = Player.new
  end

  # POST /players
  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to @player, notice: 'Player was successfully created.'
    else
      render :new
    end
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    {}
  end
end
