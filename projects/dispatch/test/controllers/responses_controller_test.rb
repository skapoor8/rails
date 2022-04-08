require "test_helper"

class ResponsesControllerTest < ActionController::TestCase
  def response
    @response ||= responses :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:responses)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Response.count") do
      post :create, response: { custom_comment: response.custom_comment, incident_id: response.incident_id, user_id: response.user_id }
    end

    assert_redirected_to response_path(assigns(:response))
  end

  def test_show
    get :show, id: response
    assert_response :success
  end

  def test_edit
    get :edit, id: response
    assert_response :success
  end

  def test_update
    put :update, id: response, response: { custom_comment: response.custom_comment, incident_id: response.incident_id, user_id: response.user_id }
    assert_redirected_to response_path(assigns(:response))
  end

  def test_destroy
    assert_difference("Response.count", -1) do
      delete :destroy, id: response
    end

    assert_redirected_to responses_path
  end
end
