require "test_helper"

class BorrowingsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    @book = books(:one)
  end

  test "should create borrowing when book is available" do
    post login_path, params: { session: { email: @user.email, password: "password" } }
    follow_redirect!

    post borrowings_path, params: { book_id: @book.id }
    assert_redirected_to user_profile_path
  end
end
