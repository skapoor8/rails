require 'test_helper'

class IncidentsControllerTest < ActionController::TestCase
  setup do
    @incident = incidents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:incidents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create incident" do
    assert_difference('Incident.count') do
      post :create, incident: { bump_count: @incident.bump_count, checkout_date: @incident.checkout_date, incident_type_id: @incident.incident_type_id, location: @incident.location, name: @incident.name, report_date: @incident.report_date, resolve_date: @incident.resolve_date, severity: @incident.severity, start_date: @incident.start_date }
    end

    assert_redirected_to incident_path(assigns(:incident))
  end

  test "should show incident" do
    get :show, id: @incident
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @incident
    assert_response :success
  end

  test "should update incident" do
    patch :update, id: @incident, incident: { bump_count: @incident.bump_count, checkout_date: @incident.checkout_date, incident_type_id: @incident.incident_type_id, location: @incident.location, name: @incident.name, report_date: @incident.report_date, resolve_date: @incident.resolve_date, severity: @incident.severity, start_date: @incident.start_date }
    assert_redirected_to incident_path(assigns(:incident))
  end

  test "should destroy incident" do
    assert_difference('Incident.count', -1) do
      delete :destroy, id: @incident
    end

    assert_redirected_to incidents_path
  end
end
