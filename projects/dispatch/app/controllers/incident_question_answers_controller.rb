class IncidentQuestionAnswersController < ApplicationController
  before_action :authenticate
  before_action :set_incident_question_answer, only: [:show, :edit, :update, :destroy]

  # GET /incident_question_answers
  # GET /incident_question_answers.json
  def index
    @incident_question_answers = IncidentQuestionAnswer.all
  end

  # GET /incident_question_answers/1
  # GET /incident_question_answers/1.json
  def show
  end

  # GET /incident_question_answers/new
  def new
    @incident_question_answer = IncidentQuestionAnswer.new
  end

  # GET /incident_question_answers/1/edit
  def edit
  end

  # POST /incident_question_answers
  # POST /incident_question_answers.json
  def create
    @incident_question_answer = IncidentQuestionAnswer.new(incident_question_answer_params)

    respond_to do |format|
      if @incident_question_answer.save
        format.html { redirect_to @incident_question_answer, notice: 'Incident question answer was successfully created.' }
        format.json { render :show, status: :created, location: @incident_question_answer }
      else
        format.html { render :new }
        format.json { render json: @incident_question_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incident_question_answers/1
  # PATCH/PUT /incident_question_answers/1.json
  def update
    respond_to do |format|
      if @incident_question_answer.update(incident_question_answer_params)
        format.html { redirect_to @incident_question_answer, notice: 'Incident question answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @incident_question_answer }
      else
        format.html { render :edit }
        format.json { render json: @incident_question_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incident_question_answers/1
  # DELETE /incident_question_answers/1.json
  def destroy
    @incident_question_answer.destroy
    respond_to do |format|
      format.html { redirect_to incident_question_answers_url, notice: 'Incident question answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incident_question_answer
      @incident_question_answer = IncidentQuestionAnswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incident_question_answer_params
      params.require(:incident_question_answer).permit(:incident_question_id, :answer, :default_answer)
    end
end
