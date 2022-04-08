require "test_helper"

class IncidentQuestionCustomAnswersControllerTest < ActionController::TestCase
  def incident_question_custom_answer
    @incident_question_custom_answer ||= incident_question_custom_answers :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:incident_question_custom_answers)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("IncidentQuestionCustomAnswer.count") do
      post :create, incident_question_custom_answer: { answer: incident_question_custom_answer.answer, incident_question_id: incident_question_custom_answer.incident_question_id, range_value: incident_question_custom_answer.range_value }
    end

    assert_redirected_to incident_question_custom_answer_path(assigns(:incident_question_custom_answer))
  end

  def test_show
    get :show, id: incident_question_custom_answer
    assert_response :success
  end

  def test_edit
    get :edit, id: incident_question_custom_answer
    assert_response :success
  end

  def test_update
    put :update, id: incident_question_custom_answer, incident_question_custom_answer: { answer: incident_question_custom_answer.answer, incident_question_id: incident_question_custom_answer.incident_question_id, range_value: incident_question_custom_answer.range_value }
    assert_redirected_to incident_question_custom_answer_path(assigns(:incident_question_custom_answer))
  end

  def test_destroy
    assert_difference("IncidentQuestionCustomAnswer.count", -1) do
      delete :destroy, id: incident_question_custom_answer
    end

    assert_redirected_to incident_question_custom_answers_path
  end
end
