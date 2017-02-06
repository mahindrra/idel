class LearnerStylesController < ApplicationController
  
  before_action :is_admin?
  before_action :set_learner_style, only: [:show, :edit, :update, :destroy]

  # GET /learner_styles
  # GET /learner_styles.json
  def index
    @learner_styles = LearnerStyle.all
  end

  # GET /learner_styles/1
  # GET /learner_styles/1.json
  def show
  end

  # GET /learner_styles/new
  def new
    @learner_style = LearnerStyle.new
  end

  # GET /learner_styles/1/edit
  def edit
  end

  # POST /learner_styles
  # POST /learner_styles.json
  def create
    @learner_style = LearnerStyle.new(learner_style_params)

    respond_to do |format|
      if @learner_style.save
        format.html { redirect_to @learner_style, notice: 'Learner style was successfully created.' }
        format.json { render :show, status: :created, location: @learner_style }
      else
        format.html { render :new }
        format.json { render json: @learner_style.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /learner_styles/1
  # PATCH/PUT /learner_styles/1.json
  def update
    respond_to do |format|
      if @learner_style.update(learner_style_params)
        format.html { redirect_to @learner_style, notice: 'Learner style was successfully updated.' }
        format.json { render :show, status: :ok, location: @learner_style }
      else
        format.html { render :edit }
        format.json { render json: @learner_style.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learner_styles/1
  # DELETE /learner_styles/1.json
  def destroy
    @learner_style.destroy
    respond_to do |format|
      format.html { redirect_to learner_styles_url, notice: 'Learner style was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learner_style
      @learner_style = LearnerStyle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def learner_style_params
      params.require(:learner_style).permit(:name)
    end
end
