require "test_helper"

class IncidentQuestionAnswerTest < ActiveSupport::TestCase
  def incident_question_answer
    @incident_question_answer ||= IncidentQuestionAnswer.new
  end

  def test_valid
    assert incident_question_answer.valid?
  end
end
