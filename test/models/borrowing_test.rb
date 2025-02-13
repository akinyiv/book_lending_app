require "test_helper"

class BorrowingTest < ActiveSupport::TestCase
  test "should not save borrowing without user and book" do
    borrowing = Borrowing.new(due_date: Date.today + 14.days)
    assert_not borrowing.save, "Saved the borrowing without user or book"
  end

  test "should set due date automatically" do
    user = User.create(name: "User", email: "user@example.com", password: "password")
    book = Book.create(title: "Test Book", author: "Author", isbn: "4444444444")

    borrowing = Borrowing.create(user: user, book: book)

    assert_not_nil borrowing.due_date, "Borrowing should have a due date set automatically"
  end

  test "should mark book as available when returned" do
    user = User.create(name: "User", email: "user@example.com", password: "password")
    book = Book.create(title: "Test Book", author: "Author", isbn: "6666666666")

    borrowing = Borrowing.create(user: user, book: book)
    borrowing.return_book

    assert book.reload.available, "Book should be available after return"
  end
end
