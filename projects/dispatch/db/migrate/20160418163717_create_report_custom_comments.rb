class CreateReportCustomComments < ActiveRecord::Migration
  def change
    create_table :report_custom_comments do |t|
      t.references :incident, index: true
      t.references :incident_question, index: true
      t.text :answer
      t.integer :range_value

      t.timestamps null: false
    end
    add_foreign_key :report_custom_comments, :incident_questions
    add_foreign_key :report_custom_comments, :incidents
  end
end
