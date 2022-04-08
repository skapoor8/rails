require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  
	test "invalid signup information" do
		get signup_path
		assert_no_difference 'User.count' do
			post users_path, user: {first_name: "", last_name: "", email: "user@fake", phone_number: "23" password: "pass", password_confirmation: "word"}
		end
		assert_template 'users/new'
	end

	test "valid signup information" do
		get signup_path
		assert_difference 'User.count', 1 do
			post_via_redirect users_path, user: {first_name: "Firstname", last_name: "Lastname", email: "email@email.com", phone_number: "1234567890" password: "password", password_confirmation: "password"}
		end
		assert_template 'users/show'
		assert_not flash.FILL_IN
		assert is_logged_in?
	end
end
