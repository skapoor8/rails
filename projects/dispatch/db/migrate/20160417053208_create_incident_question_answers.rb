class CreateIncidentQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :incident_question_answers do |t|
      t.references :incident_question, index: true
      t.string :answer, null: false
      t.boolean :default_answer, null: false

      t.timestamps null: false
    end
    add_foreign_key :incident_question_answers, :incident_questions
  end
end
