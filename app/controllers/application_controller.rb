class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user, :sortable

  def log_in user
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end

  def current_user?(user)
    user == current_user
  end

  def logged_in?
    current_user
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == params[:sort] && params[:direction] == 'asc' ? 'desc' : 'asc'
    helpers.link_to title, sort: column, direction: direction
  end
end
