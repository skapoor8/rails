json.array!(@incident_question_custom_answers) do |incident_question_custom_answer|
  json.extract! incident_question_custom_answer, :id, :incident_question_id, :answer, :range_value
  json.url incident_question_custom_answer_url(incident_question_custom_answer, format: :json)
end
