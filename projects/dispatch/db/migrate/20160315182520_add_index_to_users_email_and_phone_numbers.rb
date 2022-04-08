class AddIndexToUsersEmailAndPhoneNumbers < ActiveRecord::Migration
  def change
  	add_index :users, [:email, :phone_number], unique: true
  end
end
