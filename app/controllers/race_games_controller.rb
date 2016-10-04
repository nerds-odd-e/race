class RaceGamesController < ApplicationController
  before_action :set_race_game, only: [:show, :edit, :update, :destroy]

  # GET /race_games
  # GET /race_games.json
  def index
    @race_games = RaceGame.all
  end

  # GET /race_games/1
  # GET /race_games/1.json
  def show
  end

  # GET /race_games/new
  def new
    @race_game = RaceGame.new
  end

  # GET /race_games/1/edit
  def edit
  end

  # POST /race_games
  # POST /race_games.json
  def create
    @race_game = RaceGame.new(race_game_params)

    respond_to do |format|
      if @race_game.save
        format.html { redirect_to @race_game, notice: 'Race game was successfully created.' }
        format.json { render :show, status: :created, location: @race_game }
      else
        format.html { render :new }
        format.json { render json: @race_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /race_games/1
  # PATCH/PUT /race_games/1.json
  def update
    respond_to do |format|
      if @race_game.update(race_game_params)
        format.html { redirect_to @race_game, notice: 'Race game was successfully updated.' }
        format.json { render :show, status: :ok, location: @race_game }
      else
        format.html { render :edit }
        format.json { render json: @race_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /race_games/1
  # DELETE /race_games/1.json
  def destroy
    @race_game.destroy
    respond_to do |format|
      format.html { redirect_to race_games_url, notice: 'Race game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_race_game
      @race_game = RaceGame.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def race_game_params
      params.require(:race_game).permit(:distance)
    end
end
