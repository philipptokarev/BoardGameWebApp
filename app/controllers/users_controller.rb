class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      log_in user
      redirect_to user
    else
      redirect_to signup_path
    end
  end

  def show
    begin
      @user = User.find(params[:id])
    rescue
      flash[:error] = 'User not found'
      redirect_to root_path
    else
      @user
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :surname, :login, :password,
                                   :password_confirmation)
    end
end
