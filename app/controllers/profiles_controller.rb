class ProfilesController < ApplicationController
  include ProfilesHelper

  before_action :authenticate_user!

  def profile
    @user = current_user
    @borrowed_books = @user.borrowings.includes(:book).where(returned_at: nil)
    @returned_books = @user.borrowings.includes(:book).where.not(returned_at: nil)
  end
end
