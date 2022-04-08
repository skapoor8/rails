class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :incident, index: true
      t.references :user, index: true
      t.text :custom_comment, null: false

      t.timestamps null: false
    end
    add_foreign_key :responses, :incidents
    add_foreign_key :responses, :users
  end
end
