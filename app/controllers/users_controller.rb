class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = 'user'
    if @user.save
      redirect_to @user
    else
      redirect_to signup_path
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
