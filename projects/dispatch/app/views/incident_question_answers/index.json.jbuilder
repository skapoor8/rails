json.array!(@incident_question_answers) do |incident_question_answer|
  json.extract! incident_question_answer, :id, :incident_question_id, :answer, :default_answer
  json.url incident_question_answer_url(incident_question_answer, format: :json)
end
