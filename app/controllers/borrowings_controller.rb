class BorrowingsController < ApplicationController
  include BorrowingsHelper
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id]) # Ensure book_id is received
    if @book.available?
      @borrowing = current_user.borrowings.create(book: @book, due_date: Date.today + 14.days)
      @book.update(available: false)
      redirect_to user_profile_path, notice: "Book borrowed successfully."
    else
      redirect_to books_path, alert: "This book is already borrowed."
    end
  end


  def destroy
    @borrowing = current_user.borrowings.find_by(book_id: params[:id])
    if @borrowing
      @borrowing.update(returned_at: Time.now)
      @book = @borrowing.book
      @book.update(available: true)
      redirect_to user_profile_path, notice: "Book returned successfully."
    else
      redirect_to user_profile_path, alert: "Something went wrong."
    end
  end
end
