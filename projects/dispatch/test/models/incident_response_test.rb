require "test_helper"

class IncidentResponseTest < ActiveSupport::TestCase
  def incident_response
    @incident_response ||= IncidentResponse.new
  end

  def test_valid
    assert incident_response.valid?
  end
end
