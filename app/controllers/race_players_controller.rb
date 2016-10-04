class RacePlayersController < ApplicationController
  before_action :set_race_player, only: [:show, :edit, :update, :destroy]

  # GET /race_players/1
  # GET /race_players/1.json
  def show
  end

  # GET /race_players/new
  def new
    @race_player = RacePlayer.create race_game: RaceGame.find(params[:race_game_id])
    redirect_to @race_player
  end

  # GET /race_players/1/edit
  def edit
  end

  # PATCH/PUT /race_players/1
  # PATCH/PUT /race_players/1.json
  def update
    respond_to do |format|
      if @race_player.update(race_player_params)
        format.html { redirect_to @race_player, notice: 'Race player was successfully updated.' }
        format.json { render :show, status: :ok, location: @race_player }
      else
        format.html { render :edit }
        format.json { render json: @race_player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /race_players/1
  # DELETE /race_players/1.json
  def destroy
    @race_player.destroy
    respond_to do |format|
      format.html { redirect_to race_players_url, notice: 'Race player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_race_player
    @race_player = RacePlayer.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def race_player_params
    params.fetch(:race_player, {})
  end
end
