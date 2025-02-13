require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get books_path
    assert_response :success
  end

  test "should show book" do
    get book_path(@book)
    assert_response :success
  end
end
