class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy, :next]

  def index
    redirect_to action: :new
  end

  def show
    @clue = TeamClues.clue_for_team(@team.id)
  end

  def new
    @team = Team.new
  end

  def next
    TeamClues.next_clue_for!(@team.id)
    redirect_to team_url(id: @team.id)
  end

  def create
    @team = Team.find_by_name(team_params["name"])
    if !@team.present?
      @team = Team.new(team_params)
      @team.clue_order = TeamClues.clue_ids_in_random_order.join(",")
      @team.current_clue_index = 0
    end
    if @team.save
      redirect_to(@team)
    else
      redirect_to action: :new, notice: 'Gotta enter a team name!'
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def team_params
    params.require(:team).permit(:name)
  end
end
