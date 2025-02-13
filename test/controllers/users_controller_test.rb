require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_path
    assert_response :success
  end

  test "should create user" do
    post users_path, params: { user: { name: "Test User", email: "test@example.com", password: "password", password_confirmation: "password" } }
    assert_redirected_to login_path
  end

  test "should not create user with invalid data" do
    post users_path, params: { user: { name: "", email: "invalidemail", password: "pass", password_confirmation: "wrong" } }
    assert_response :unprocessable_entity
    assert_match "Sign-up failed.", response.body
  end
end
