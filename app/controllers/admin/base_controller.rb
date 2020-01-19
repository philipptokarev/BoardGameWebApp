class Admin::BaseController < ApplicationController
  before_action :ensure_admin!
  def ensure_admin!
    if !logged_in?
      flash[:error] = 'Please sign in and try again.'
      redirect_to signin_path
    elsif current_user and !current_user.admin?
      flash[:error] = 'You do not have access to this page'
      redirect_to root_path
    end
  end
end
