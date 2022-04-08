require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  def setup
  	@user = User.new(first_name: "John", last_name: "Doe", email: "johndoe@gmail.com", phone_number: "0000000000", password: "password", password_confirmation: "password")
  	@invalid_user = User.new(first_name: "Johny", last_name: "Doeman", email: "johnydoeman_gmail.com", phone_number: "000000000038048209")
  end

  test "should be valid" do 
  	assert @user.valid?
  end

  test "should be invalid" do
  	assert_not @invalid_user.valid?
  end

  test "first name should exist" do
  	@user.first_name = "   "
  	assert_not @user.valid?
  end

  test "first name shouldn't be too long" do
    @user.first_name = "a" * 61
    assert_not @user.valid?
  end

  test "last name should exist" do
  	@user.last_name = "   "
  	assert_not @user.valid?
  end

  test "last name shouldn't be too long" do
    @user.last_name = "z" * 61
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "  "
    assert_not @user.valid?
  end

  test "email shouldn't be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@yahoo.COM A_US-ER@gmail.org
      first_last@tufts.com alice+bob@email.com]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com USER_at_yahoo.COM A_US,ER@gmail.in.org
      first_last@tuftscom alic+bob+emailcom]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email should be saved as lowercase" do
    mixed_case_email = "MiNGchOW@tuFTS.eDu"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "phone number should be present" do
    @user.phone_number = "  "
    assert_not @user.valid?
  end

  test "phone number shouldn't be too long" do
    @user.phone_number = "z" * 11 
    assert_not @user.valid?
  end

  test "phone number should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should have minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  def user
    @user ||= User.new
  end

  def test_valid
    assert user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?('')
  end
end
