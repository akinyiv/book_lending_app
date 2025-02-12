require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get profile" do
    post login_path, params: { session: { email: @user.email, password: "password" } }
    assert session[:user_id].present?, "User should be logged in"

    follow_redirect!
    assert_response :success
  end
end
