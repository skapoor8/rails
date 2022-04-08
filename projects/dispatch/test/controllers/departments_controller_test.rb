require "test_helper"

class DepartmentsControllerTest < ActionController::TestCase
  def department
    @department ||= departments :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:departments)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Department.count") do
      post :create, department: { email: department.email, name: department.name, phone: department.phone }
    end

    assert_redirected_to department_path(assigns(:department))
  end

  def test_show
    get :show, id: department
    assert_response :success
  end

  def test_edit
    get :edit, id: department
    assert_response :success
  end

  def test_update
    put :update, id: department, department: { email: department.email, name: department.name, phone: department.phone }
    assert_redirected_to department_path(assigns(:department))
  end

  def test_destroy
    assert_difference("Department.count", -1) do
      delete :destroy, id: department
    end

    assert_redirected_to departments_path
  end
end
