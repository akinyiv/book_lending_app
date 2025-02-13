class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book

  before_create :set_due_date

  def return_book
    update(returned_at: Time.current)
    book.update(available: true)
  end

  private

  def set_due_date
    self.due_date = 2.weeks.from_now.to_date
  end
end
