class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice: "Account created! Please log in"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params.require(:user).permit(:name, :email, :assword, :password_conformation)
end
