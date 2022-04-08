class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name, null: false
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
