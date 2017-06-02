class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_admin!
    authenticate_user!
    unless current_user.admin?
      redirect_to root_path, flash: { error: "Not Authorized" }
    end
  end

  helper_method :is_admin?
  def is_admin?
    @is_admin ||= current_user && current_user.admin?
  end

end
