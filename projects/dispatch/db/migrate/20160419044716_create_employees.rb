class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.references :user, index: true
      t.references :department, index: true

      t.timestamps null: false
    end
    add_foreign_key :employees, :users
    add_foreign_key :employees, :departments
  end
end
