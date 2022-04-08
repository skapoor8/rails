class ReportCommentsController < ApplicationController
  before_action :authenticate
  before_action :set_report_comment, only: [:show, :edit, :update, :destroy]

  # GET /report_comments
  # GET /report_comments.json
  def index
    @report_comments = ReportComment.all
  end

  # GET /report_comments/1
  # GET /report_comments/1.json
  def show
  end

  # GET /report_comments/new
  def new
    @report_comment = ReportComment.new
  end

  # GET /report_comments/1/edit
  def edit
  end

  # POST /report_comments
  # POST /report_comments.json
  def create
    @report_comment = ReportComment.new(incident_report_comment_params)

    respond_to do |format|
      if @report_comment.save
        format.html { redirect_to @report_comment, notice: 'Report comment was successfully created.' }
        format.json { render :show, status: :created, location: @report_comment }
      else
        format.html { render :new }
        format.json { render json: @report_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /report_comments/1
  # PATCH/PUT /report_comments/1.json
  def update
    respond_to do |format|
      if @report_comment.update(incident_report_comment_params)
        format.html { redirect_to @report_comment, notice: 'Report comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @report_comment }
      else
        format.html { render :edit }
        format.json { render json: @report_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /report_comments/1
  # DELETE /report_comments/1.json
  def destroy
    @report_comment.destroy
    respond_to do |format|
      format.html { redirect_to report_comments_url, notice: 'Report comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report_comment
      @report_comment = ReportComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_comment_params
      params.require(:report_comment).permit(:incident_question_answer_id, :incident_id)
    end
end
