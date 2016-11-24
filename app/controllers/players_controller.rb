class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :select_dice]

  def select_dice
    if params[:choice] == 'normal'
      @player.go_random_normal
    else
      @player.go_random_super
    end
    
    redirect_to player_path(@player, thrown: "thrown")
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

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
        {}
    end
end
