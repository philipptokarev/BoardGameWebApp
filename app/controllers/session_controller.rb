class SessionController < ApplicationController
  include SessionHelper

  def create
    @user = User.find_by(login: params[:session][:login].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to @user
    else
      redirect_to signin_path
    end
  end
end
