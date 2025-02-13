class BorrowingsController < ApplicationController
  include BorrowingsHelper
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    if @book.available?
      @borrowing = current_user.borrowings.create(book: @book, due_date: Date.today + 14.days)
      @book.update(available: false)
      redirect_to user_profile_path, notice: "Book borrowed successfully."
    else
      redirect_to books_path, alert: "This book is already borrowed."
    end
  end


  def destroy
    @borrowing = current_user.borrowings.find(params[:id])

    if @borrowing
      @borrowing.return_book
      redirect_to user_profile_path, notice: "Book returned successfully."
    else
      redirect_to user_profile_path, alert: "Something went wrong."
    end
  end
end
