class RaceMovesController < ApplicationController
  before_action :set_race_move, only: [:show, :edit, :update, :destroy]

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
    @race_player = RacePlayer.find(params[:race_player_id])
    @race_move = @race_player.race_moves.new(race_move_params)

    respond_to do |format|
      if @race_move.save
        flash[:notice] = 'You just made the move'
        format.json { render :show, status: :created, location: @race_move }
      else
        flash[:alert] = @race_move.errors.full_messages.join(', ')
        format.json { render json: @race_move.errors, status: :unprocessable_entity }
      end
      format.html { redirect_to @race_player }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_race_move
    @race_move = RaceMove.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def race_move_params
    params.require(:race_move).permit(:choice)
  end
end
