require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should log in with valid credentials" do
    user = users(:one)
    post login_path, params: { session: { email: user.email, password: "password" } }
    assert_redirected_to root_path
  end
end
