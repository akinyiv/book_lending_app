require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save user without email" do
    user = User.new(name: "Test User", password: "password")
    assert_not user.save, "Saved the user without an email"
  end

  test "should save user with valid details" do
    user = User.new(name: "Test User", email: "user@example.com", password: "password", password_confirmation: "password")
    assert user.save
  end
end