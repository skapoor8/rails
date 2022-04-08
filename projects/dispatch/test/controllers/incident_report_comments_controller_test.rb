require "test_helper"

class IncidentReportCommentsControllerTest < ActionController::TestCase
  def incident_report_comment
    @incident_report_comment ||= incident_report_comments :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:incident_report_comments)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("IncidentReportComment.count") do
      post :create, incident_report_comment: { incident_id: incident_report_comment.incident_id, incident_question_answer_id: incident_report_comment.incident_question_answer_id }
    end

    assert_redirected_to incident_report_comment_path(assigns(:incident_report_comment))
  end

  def test_show
    get :show, id: incident_report_comment
    assert_response :success
  end

  def test_edit
    get :edit, id: incident_report_comment
    assert_response :success
  end

  def test_update
    put :update, id: incident_report_comment, incident_report_comment: { incident_id: incident_report_comment.incident_id, incident_question_answer_id: incident_report_comment.incident_question_answer_id }
    assert_redirected_to incident_report_comment_path(assigns(:incident_report_comment))
  end

  def test_destroy
    assert_difference("IncidentReportComment.count", -1) do
      delete :destroy, id: incident_report_comment
    end

    assert_redirected_to incident_report_comments_path
  end
end
