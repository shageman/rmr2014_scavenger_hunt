class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    redirect_to action: :new
  end

  def show
    @clue = Clue.all.sample
  end

  def new
    @team = Team.new
  end

  def create
    if @team = Team.first_or_create(team_params)
      redirect_to @team, notice: 'Team was successfully created.'
    else
      render action: 'new'
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
