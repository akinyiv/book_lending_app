require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "should not save book without title" do
    book = Book.new(author: "John Doe", isbn: "1234567890")
    assert_not book.save, "Saved the book without a title"
  end

  test "should not save book without author" do
    book = Book.new(title: "Book Title", isbn: "1234567890")
    assert_not book.save, "Saved the book without an author"
  end

  test "should not save book without ISBN" do
    book = Book.new(title: "Book Title", author: "John Doe")
    assert_not book.save, "Saved the book without an ISBN"
  end

  test "should not save book with duplicate ISBN" do
    Book.create(title: "Book 1", author: "Author 1", isbn: "1234567890")
    duplicate_book = Book.new(title: "Book 2", author: "Author 2", isbn: "1234567890")
    assert_not duplicate_book.save, "Saved a book with a duplicate ISBN"
  end

  test "should have available set to true when no active borrowings" do
    book = Book.create(title: "Available Book", author: "Author", isbn: "1111111111")
    assert book.available, "Book should be available by default"
  end

  test "should update availability when returned" do
    book = Book.create(title: "Test Book", author: "Author", isbn: "3333333333")
    user = User.create(name: "User", email: "user@example.com", password: "password")

    borrowing = Borrowing.create(user: user, book: book)
    borrowing.return_book

    assert book.reload.available, "Book should be available after returning"
  end
end
