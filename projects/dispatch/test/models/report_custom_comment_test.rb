require "test_helper"

class ReportCustomCommentTest < ActiveSupport::TestCase
  def report_custom_comment
    @report_custom_comment ||= ReportCustomComment.new
  end

  def test_valid
    assert report_custom_comment.valid?
  end
end
