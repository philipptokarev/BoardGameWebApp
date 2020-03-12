class SessionController < ApplicationController
  def create
    user = User.find_by(login: params[:session][:login].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      redirect_to user, notice: 'You logged in'
    else
      redirect_to signin_path, notice: 'Login or password are wrong'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
