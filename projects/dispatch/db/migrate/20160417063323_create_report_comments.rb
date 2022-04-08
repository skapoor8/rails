class CreateReportComments < ActiveRecord::Migration
  def change
    create_table :report_comments do |t|
      t.references :incident_question_answer, index: true
      t.references :incident, index: true

      t.timestamps null: false
    end
    add_foreign_key :report_comments, :incident_question_answers
    add_foreign_key :report_comments, :incidents
  end
end
