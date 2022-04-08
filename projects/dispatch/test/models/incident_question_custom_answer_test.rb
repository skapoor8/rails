require "test_helper"

class IncidentQuestionCustomAnswerTest < ActiveSupport::TestCase
  def incident_question_custom_answer
    @incident_question_custom_answer ||= IncidentQuestionCustomAnswer.new
  end

  def test_valid
    assert incident_question_custom_answer.valid?
  end
end
