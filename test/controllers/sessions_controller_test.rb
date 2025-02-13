require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should log in with valid credentials" do
    post login_path, params: { session: { email: @user.email, password: "password" } }
    assert_redirected_to root_path
  end

  test "should not log in with invalid credentials" do
    post login_path, params: { session: { email: @user.email, password: "wrongpassword" } }
    assert_response :unprocessable_entity
    assert_match "Invalid email or password.", response.body
  end

  test "should log out" do
    post login_path, params: { session: { email: @user.email, password: "password" } }
    delete logout_path
    assert_redirected_to root_path
  end
end
