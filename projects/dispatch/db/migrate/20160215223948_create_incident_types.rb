class CreateIncidentTypes < ActiveRecord::Migration
  def change
    create_table :incident_types do |t|
      t.string :name, null: false
      t.integer :default_severity

      t.timestamps null: false
    end
  end
end
