class Admin::BaseController < ApplicationController
  before_action :ensure_admin!
  def ensure_admin!
    redirect_to(root_path, alert: "You do not have access to this page") unless logged_in? && current_user.admin?
  end
end
