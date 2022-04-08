class IncidentsController < ApplicationController
    before_action :authenticate
    before_action :set_incident, only: [:show, :edit, :update, :destroy]
    

    # GET /incidents
    # GET /incidents.json
    def index
        @incidents = Incident.all_cached.sortBy(params.slice(:sort_by, :sort_direction)).includes(:incident_type).paginate(page: params[:page], per_page: 10)
    end

    # GET /incidents/1
    # GET /incidents/1.json
    def show
        type_id = @incident.incident_type_id
        @incident_questions = IncidentQuestion.all_cached.where(incident_type_id: type_id)
        @report_comments = ReportComment.all_cached.where(incident_id: @incident.id).includes(:incident_question_answer)
        @report_custom_comments = ReportCustomComment.all_cached.where(incident_id: @incident.id).includes(:incident_question)
        @responses = Response.all_cached.where(incident_id: @incident_id).includes(:incident, :user)
    end

    # GET /incidents/new
    def new
        @incident = Incident.new
        @incident_questions = IncidentQuestion.all_cached
        @incident.report_custom_comments.build
        @incident.report_comments.build
    end

    # GET /incidents/1/edit
    def edit
    end

    # POST /incidents
    # POST /incidents.json
    def create
        @incident = Incident.new(incident_params)
        @incident.report_date = Time.now.getutc;
        @incident.user_id = current_user.id 
        # have to search through incident_params
        # have question id and selected answer id
        # if range, custom, string -> report_custom_comments
        # else if radio, checkbox -> report_comments
        logger.debug incident_params
        respond_to do |format|
            if @incident.save
                $redis.publish('incidents.create', @incident.to_json)
                format.html { redirect_to @incident, notice: 'Incident was successfully created.' }
                format.json { render :show, status: :created, location: @incident }
            else
                format.html { render :new }
                format.json { render json: @incident.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /incidents/1
    # PATCH/PUT /incidents/1.json
    def update
        respond_to do |format|
            if @incident.update(incident_params)
                format.html { redirect_to @incident, notice: 'Incident was successfully updated.' }
                format.json { render :show, status: :ok, location: @incident }
            else
                format.html { render :edit }
                format.json { render json: @incident.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /incidents/1
    # DELETE /incidents/1.json
    def destroy
        @incident.destroy
        respond_to do |format|
            format.html { redirect_to incidents_url, notice: 'Incident was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_incident
            @incident = Incident.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def incident_params
            params.require(:incident).permit(:location, :report_date, :start_date, 
                :checkout_date, :resolve_date, :incident_type_id, 
                :severity, :bump_count, :name)
        end

end
