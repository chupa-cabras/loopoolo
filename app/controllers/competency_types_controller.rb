class CompetencyTypesController < ApplicationController
  before_action :set_competency_type, only: [:show, :edit, :update, :destroy]

  # GET /competency_types
  # GET /competency_types.json
  def index
    @competency_types = CompetencyType.all
  end

  # GET /competency_types/1
  # GET /competency_types/1.json
  def show
  end

  # GET /competency_types/new
  def new
    @competency_type = CompetencyType.new
  end

  # GET /competency_types/1/edit
  def edit
  end

  # POST /competency_types
  # POST /competency_types.json
  def create
    @competency_type = CompetencyType.new(competency_type_params)

    respond_to do |format|
      if @competency_type.save
        format.html { redirect_to @competency_type, notice: 'Competency type was successfully created.' }
        format.json { render :show, status: :created, location: @competency_type }
      else
        format.html { render :new }
        format.json { render json: @competency_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competency_types/1
  # PATCH/PUT /competency_types/1.json
  def update
    respond_to do |format|
      if @competency_type.update(competency_type_params)
        format.html { redirect_to @competency_type, notice: 'Competency type was successfully updated.' }
        format.json { render :show, status: :ok, location: @competency_type }
      else
        format.html { render :edit }
        format.json { render json: @competency_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competency_types/1
  # DELETE /competency_types/1.json
  def destroy
    @competency_type.destroy
    respond_to do |format|
      format.html { redirect_to competency_types_url, notice: 'Competency type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competency_type
      @competency_type = CompetencyType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competency_type_params
      params.fetch(:competency_type, {})
    end
end
