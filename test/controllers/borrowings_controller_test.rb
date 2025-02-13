require "test_helper"

class BorrowingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @book = books(:one)
    post login_path, params: { session: { email: @user.email, password: "password" } }
  end

  test "should create borrowing when book is available" do
    post borrowings_path, params: { book_id: @book.id }
    assert_redirected_to user_profile_path
  end

  test "should destroy borrowing (return book)" do
    borrowing = @user.borrowings.create!(book: @book, due_date: Date.today + 14.days)
    delete borrowing_path(borrowing)
    assert_redirected_to user_profile_path
  end
end
