class UpdateIncidentQuestionTableName < ActiveRecord::Migration
  def change
    rename_table :incident_question_fill_ins, :incident_questions
  end
end
