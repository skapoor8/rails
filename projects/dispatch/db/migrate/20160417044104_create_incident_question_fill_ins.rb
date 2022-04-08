class CreateIncidentQuestionFillIns < ActiveRecord::Migration
  def change
    create_table :incident_question_fill_ins do |t|
      t.references :incident_type, index: true
      t.string :question, null: false
      t.integer :question_form, null: false
      t.integer :min_val
      t.integer :max_val

      t.timestamps null: false
    end
    add_foreign_key :incident_question_fill_ins, :incident_types
  end
end
