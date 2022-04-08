require "test_helper"

class IncidentReportCommentTest < ActiveSupport::TestCase
  def incident_report_comment
    @incident_report_comment ||= IncidentReportComment.new
  end

  def test_valid
    assert incident_report_comment.valid?
  end
end
