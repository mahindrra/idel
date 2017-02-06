class LearnerDimensionScalesController < ApplicationController
  before_action :set_learner_dimension_scale, only: [:show, :edit, :update, :destroy]

  # GET /learner_dimension_scales
  # GET /learner_dimension_scales.json
  def index
    @learner_dimension_scales = LearnerDimensionScale.all
  end

  # GET /learner_dimension_scales/1
  # GET /learner_dimension_scales/1.json
  def show
  end

  # GET /learner_dimension_scales/new
  def new
    @learner_dimension_scale = LearnerDimensionScale.new
  end

  # GET /learner_dimension_scales/1/edit
  def edit
  end

  # POST /learner_dimension_scales
  # POST /learner_dimension_scales.json
  def create
    @learner_dimension_scale = LearnerDimensionScale.new(learner_dimension_scale_params)

    respond_to do |format|
      if @learner_dimension_scale.save
        format.html { redirect_to @learner_dimension_scale, notice: 'Learner dimension scale was successfully created.' }
        format.json { render :show, status: :created, location: @learner_dimension_scale }
      else
        format.html { render :new }
        format.json { render json: @learner_dimension_scale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /learner_dimension_scales/1
  # PATCH/PUT /learner_dimension_scales/1.json
  def update
    respond_to do |format|
      if @learner_dimension_scale.update(learner_dimension_scale_params)
        format.html { redirect_to @learner_dimension_scale, notice: 'Learner dimension scale was successfully updated.' }
        format.json { render :show, status: :ok, location: @learner_dimension_scale }
      else
        format.html { render :edit }
        format.json { render json: @learner_dimension_scale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learner_dimension_scales/1
  # DELETE /learner_dimension_scales/1.json
  def destroy
    @learner_dimension_scale.destroy
    respond_to do |format|
      format.html { redirect_to learner_dimension_scales_url, notice: 'Learner dimension scale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learner_dimension_scale
      @learner_dimension_scale = LearnerDimensionScale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def learner_dimension_scale_params
      params.require(:learner_dimension_scale).permit(:name, :learner_style_id)
    end
end
