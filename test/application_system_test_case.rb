require "application_system_test_case"

class UserFlowsTest < ApplicationSystemTestCase
  test "user can sign up and log in" do
    visit signup_path
    fill_in "Name", with: "New User"
    fill_in "Email", with: "newuser@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign Up"
    assert_text "Welcome"
  end
end