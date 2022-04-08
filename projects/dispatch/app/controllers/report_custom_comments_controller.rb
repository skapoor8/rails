class ReportCustomCommentssController < ApplicationController
  before_action :authenticate
  before_action :set_report_custom_comment, only: [:show, :edit, :update, :destroy]

  # GET /report_custom_comments
  # GET /report_custom_comments.json
  def index
    @report_custom_comments = ReportCustomComment.all
  end

  # GET /report_custom_comments/1
  # GET /report_custom_comments/1.json
  def show
  end

  # GET /report_custom_comments/new
  def new
    @report_custom_comment = ReportCustomComment.new
  end

  # GET /report_custom_comments/1/edit
  def edit
  end

  # POST /report_custom_comments
  # POST /report_custom_comments.json
  def create
    @report_custom_comment = ReportCustomComment.new(report_custom_comment_params)

    respond_to do |format|
      if @report_custom_comment.save
        format.html { redirect_to @report_custom_comment, notice: 'Report custom comment was successfully created.' }
        format.json { render :show, status: :created, location: @report_custom_comment }
      else
        format.html { render :new }
        format.json { render json: @report_custom_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /report_custom_comments/1
  # PATCH/PUT /report_custom_comments/1.json
  def update
    respond_to do |format|
      if @report_custom_comment.update(report_custom_comment_params)
        format.html { redirect_to @report_custom_comment, notice: 'Report custom comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @report_custom_comment }
      else
        format.html { render :edit }
        format.json { render json: @report_custom_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /report_custom_comments/1
  # DELETE /report_custom_comments/1.json
  def destroy
    @report_custom_comment.destroy
    respond_to do |format|
      format.html { redirect_to report_custom_comments_url, notice: 'Report custom comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report_custom_comment
      @report_custom_comment = ReportCustomComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_custom_comment_params
      params.require(:report_custom_comment).permit(:incident_question_id, :answer, :range_value)
    end
end
