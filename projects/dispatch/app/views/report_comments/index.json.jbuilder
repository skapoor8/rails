json.array!(@incident_report_comments) do |incident_report_comment|
  json.extract! incident_report_comment, :id, :incident_question_answer_id, :incident_id
  json.url incident_report_comment_url(incident_report_comment, format: :json)
end
