require "test_helper"

class ResponseTest < ActiveSupport::TestCase
  def response
    @response ||= Response.new
  end

  def test_valid
    assert response.valid?
  end
end
