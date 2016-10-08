class RaceMovesController < ApplicationController # :nodoc:
  before_action :set_race_move, only: [:show, :edit, :update, :destroy]
  before_action :set_race_player, only: [:create]

  # GET /race_moves
  # GET /race_moves.json
  def index
    @race_moves = RaceMove.all
  end

  # GET /race_moves/1
  # GET /race_moves/1.json
  def show
  end

  # GET /race_moves/new
  def new
    @race_move = RaceMove.new
  end

  # GET /race_moves/1/edit
  def edit
  end

  # POST /race_moves
  # POST /race_moves.json
  def create
    @race_move = @race_player.race_moves.new(race_move_params)

    respond_to do |format|
      if @race_move.save
        flash[:notice] = 'You just made the move'
      else
        flash[:alert] = @race_move.errors.full_messages.join(', ')
      end
      format.html { redirect_to @race_player }
    end
  end

  private

  def set_race_move
    @race_move = RaceMove.find(params[:id])
  end

  def set_race_player
    @race_player = RacePlayer.find(params[:race_player_id])
  end

  def race_move_params
    params.require(:race_move).permit(:choice)
  end
end
