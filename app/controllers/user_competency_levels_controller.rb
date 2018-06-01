class UserCompetencyLevelsController < ApplicationController
  before_action :set_user_competency_level, only: [:show, :edit, :update, :destroy]

  # GET /user_competency_levels
  # GET /user_competency_levels.json
  def index
    @user_competency_levels = UserCompetencyLevel.all
  end

  # GET /user_competency_levels/1
  # GET /user_competency_levels/1.json
  def show
  end

  # GET /user_competency_levels/new
  def new
    @user_competency_level = UserCompetencyLevel.new
  end

  # GET /user_competency_levels/1/edit
  def edit
  end

  # POST /user_competency_levels
  # POST /user_competency_levels.json
  def create
    @user_competency_level = UserCompetencyLevel.new(user_competency_level_params)

    respond_to do |format|
      if @user_competency_level.save
        format.html { redirect_to @user_competency_level, notice: 'User competency level was successfully created.' }
        format.json { render :show, status: :created, location: @user_competency_level }
      else
        format.html { render :new }
        format.json { render json: @user_competency_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_competency_levels/1
  # PATCH/PUT /user_competency_levels/1.json
  def update
    respond_to do |format|
      if @user_competency_level.update(user_competency_level_params)
        format.html { redirect_to @user_competency_level, notice: 'User competency level was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_competency_level }
      else
        format.html { render :edit }
        format.json { render json: @user_competency_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_competency_levels/1
  # DELETE /user_competency_levels/1.json
  def destroy
    @user_competency_level.destroy
    respond_to do |format|
      format.html { redirect_to user_competency_levels_url, notice: 'User competency level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_competency_level
      @user_competency_level = UserCompetencyLevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_competency_level_params
      params.require(:user_competency_level).permit(:user_id, :competency_id, :level_id, :started_date)
    end
end
