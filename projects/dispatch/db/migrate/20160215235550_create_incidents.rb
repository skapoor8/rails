class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.string :location, null: false
      t.timestamp :report_date
      t.timestamp :start_date, null: false
      t.timestamp :checkout_date
      t.timestamp :resolve_date
      t.references :incident_type, index: true
      t.integer :severity, null: false
      t.integer :bump_count
      t.string :name, null: false

      t.timestamps null: false
    end
    add_foreign_key :incidents, :incident_types
  end
end
