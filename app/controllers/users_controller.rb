class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      log_in user
      redirect_to user, notice: 'You have created an account'
    else
      redirect_to signup_path, notice: 'Maybe account with this login is already taken'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :login, :password,
                                 :password_confirmation)
  end
end
