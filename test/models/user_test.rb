require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save user without email" do
    user = User.new(name: "Test User", password: "password")
    assert_not user.save, "Saved the user without an email"
  end

  test "should save user with valid details" do
    user = User.new(name: "Test User", email: "user@example.com", password: "password", password_confirmation: "password")
    assert user.save, "User should be saved with valid details"
  end

  test "should not save user with duplicate email" do
    User.create(name: "User1", email: "duplicate@example.com", password: "password")
    user2 = User.new(name: "User2", email: "duplicate@example.com", password: "password")

    assert_not user2.save, "User should not be saved with duplicate email"
  end

  test "should not save user with short password" do
    user = User.new(name: "Test User", email: "user@example.com", password: "short")
    assert_not user.save, "User should not be saved with a short password"
  end

  test "email should be saved in lowercase" do
    user = User.create(name: "Test User", email: "USER@EXAMPLE.COM", password: "password")
    assert_equal "user@example.com", user.reload.email, "Email should be saved in lowercase"
  end
end
