require "test_helper"

class BorrowingTest < ActiveSupport::TestCase
  test "should not save borrowing without user and book" do
    borrowing = Borrowing.new(due_date: Date.today + 14.days)
    assert_not borrowing.save, "Saved the borrowing without user or book"
  end
end
