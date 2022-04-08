require "test_helper"

class IncidentQuestionFillInTest < ActiveSupport::TestCase
  def incident_question_fill_in
    @incident_question_fill_in ||= IncidentQuestionFillIn.new
  end

  def test_valid
    assert incident_question_fill_in.valid?
  end
end
