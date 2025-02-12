class ProfilesController < ApplicationController
  include ProfilesHelper

  before_action :authenticate_user!

  def profile
    @user = current_user
    @borrowings = @user.borrowings.includes(:book)
  end
end
