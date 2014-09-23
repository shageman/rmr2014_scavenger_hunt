class CluesController < ApplicationController
  before_action :set_clue, only: [:show, :edit, :update, :destroy]
  before_action :ensure_auth

  # GET /clues
  # GET /clues.json
  def index
    @clues = Clue.all
  end

  # GET /clues/1
  # GET /clues/1.json
  def show
  end

  # GET /clues/new
  def new
    @clue = Clue.new
  end

  # GET /clues/1/edit
  def edit
  end

  # POST /clues
  # POST /clues.json
  def create
    @clue = Clue.new(clue_params)

    respond_to do |format|
      if @clue.save
        format.html { redirect_to clue_path(@clue, auth: "abc"), notice: 'Clue was successfully created.' }
        format.json { render action: 'show', status: :created, location: @clue }
      else
        format.html { render action: 'new' }
        format.json { render json: @clue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clues/1
  # PATCH/PUT /clues/1.json
  def update
    respond_to do |format|
      if @clue.update(clue_params)
        format.html { redirect_to clue_path(@clue, auth: "abc"), notice: 'Clue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @clue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clues/1
  # DELETE /clues/1.json
  def destroy
    @clue.destroy
    respond_to do |format|
      format.html { redirect_to clues_url(auth: "abc") }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_clue
    @clue = Clue.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def clue_params
    params.require(:clue).permit(:name, :description, :clue_type)
  end

  def ensure_auth
    redirect_to teams_path unless params[:auth] == "abc"
  end
end
