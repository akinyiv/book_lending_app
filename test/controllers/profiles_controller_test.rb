require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    post login_path, params: { session: { email: @user.email, password: "password" } }
  end

  test "should get profile with borrowed and returned books" do
    borrowed_book = books(:one)
    returned_book = books(:two)

    @user.borrowings.create!(book: borrowed_book, due_date: Date.today + 14.days)
    @user.borrowings.create!(book: returned_book, due_date: Date.today - 7.days, returned_at: Date.today - 1.day)

    get user_profile_path
    assert_response :success
    assert_match borrowed_book.title, response.body
    assert_match returned_book.title, response.body
  end
end
