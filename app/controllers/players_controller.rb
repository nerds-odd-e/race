# frozen_string_literal: true
class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :select_dice]

  NORMAL = 'normal'

  def select_dice
    if @player.throw_flag
      redirect_to player_path(@player, thrown: 'thrown', message: 'please wait')
      return
    end
    go_random
    @player.save
    redirect_to player_path(@player, thrown: 'thrown')
  end

  # GET /players/1
  def show
    @thrown = params[:thrown].present?
    @message = params[:message]
    @player = ::GamesHelper::PlayerDecorator.new(@player, view_context)
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

  def go_random
    if params[:choice] == NORMAL
      @player.go_random_normal
    else
      @player.go_random_super
    end
  end
end
