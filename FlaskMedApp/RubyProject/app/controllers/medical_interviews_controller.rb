class MedicalInterviewsController < ApplicationController
  before_action :set_medical_interview, only: %i[ show edit update destroy ]

  # GET /medical_interviews or /medical_interviews.json
  def index
    @medical_interviews = MedicalInterview.all
  end

  # GET /medical_interviews/1 or /medical_interviews/1.json
  def show
  end

  # GET /medical_interviews/new
  def new
    @medical_interview = MedicalInterview.new
  end

  # GET /medical_interviews/1/edit
  def edit
  end

  # POST /medical_interviews or /medical_interviews.json
  def create
    @medical_interview = MedicalInterview.new(medical_interview_params)

    respond_to do |format|
      if @medical_interview.save
        format.html { redirect_to medical_interview_url(@medical_interview), notice: "Medical interview was successfully created." }
        format.json { render :show, status: :created, location: @medical_interview }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @medical_interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medical_interviews/1 or /medical_interviews/1.json
  def update
    respond_to do |format|
      if @medical_interview.update(medical_interview_params)
        format.html { redirect_to medical_interview_url(@medical_interview), notice: "Medical interview was successfully updated." }
        format.json { render :show, status: :ok, location: @medical_interview }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @medical_interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_interviews/1 or /medical_interviews/1.json
  def destroy
    @medical_interview.destroy

    respond_to do |format|
      format.html { redirect_to medical_interviews_url, notice: "Medical interview was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medical_interview
      @medical_interview = MedicalInterview.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def medical_interview_params
      params.require(:medical_interview).permit(:hygiene, :treatment_story, :interview_description, :meeting_id)
    end
end
