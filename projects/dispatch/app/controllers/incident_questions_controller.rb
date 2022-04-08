class IncidentQuestionsController < ApplicationController
    before_action :authenticate
    before_action :set_incident_question, only: [:show, :edit, :update, :destroy]

    # GET /incident_questions
    # GET /incident_questions.json
    def index
        logger.debug "#{params}"
        @incident_questions = IncidentQuestion.all #_cached
        # @incidents = Incident.all_cached.sortBy(params.slice(:sort_by, :sort_direction)).includes(:incident_type).paginate(page: params[:page], per_page: 10)
        # TODO: Test cache hits / misses
        # TODO: Test cache hits / misses
        # @stats = Rails.cache.stats.first.last
    end

    # GET /incident_questions/1
    # GET /incident_questions/1.json
    def show
    end

    # GET /incident_questions/new
    def new
        @incident_question = IncidentQuestion.new
    end

    # GET /incident_questions/1/edit;
    def edit
    end

    # POST /incident_questions
    # POST /incident_questions.json
    def create
        @incident_question = IncidentQuestion.new(incident_question_params)

        respond_to do |format|
            if @incident_question.save
                format.html { redirect_to @incident_question, notice: 'Incident question was successfully created.' }
                format.json { render :show, status: :created}
            else
                format.html { render :new }
                format.json { render json: @incident_question.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /incident_questions/1
    # PATCH/PUT /incident_questions/1.json
    def update
        respond_to do |format|
            if @incident_question.update(incident_question_params)
                format.html { redirect_to @incident_question, notice: 'Incident was successfully updated.' }
                format.json { render :show, status: :ok, location: @incident_question }
            else
                format.html { render :edit }
                format.json { render json: @incident_question.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /incident_questions/1
    # DELETE /incident_questions/1.json
    def destroy
        @incident_question.destroy
        respond_to do |format|
            format.html { redirect_to incidents_url, notice: 'Incident was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_incident_question
            @incident_question = IncidentQuestion.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def incident_question_params
            params.require(:incident_question).permit(:incident_type_id, :question, :min_val, :max_val)
        end

end
