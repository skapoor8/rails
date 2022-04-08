class CreateIncidentResponses < ActiveRecord::Migration
  def change
    create_table :incident_responses do |t|
      t.references :incident, index: true
      t.references :report_custom_comment, index: true
      t.references :report_comment, index: true

      t.timestamps null: false
    end

    add_foreign_key :incident_responses, :incidents
    add_foreign_key :incident_responses, :report_custom_comments
    add_foreign_key :incident_responses, :report_comments

  end
end
