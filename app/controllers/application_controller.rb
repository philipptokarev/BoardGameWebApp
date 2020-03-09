class ApplicationController < ActionController::Base
  include Pundit
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  helper_method :logged_in?, :current_user, :sortable

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    session[:user_id] && User.find(session[:user_id])
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
    direction = params[:sort_direction] == 'asc' ? 'desc' : 'asc'
    helpers.link_to title, sort_column: column, sort_direction: direction
  end

  private

  def record_not_found
    redirect_to root_path, alert: "Coundn't find it"
  end
end
