class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_admin!
    authenticate_user!
    unless current_user.admin?
      redirect_to root_path, flash: { error: "Not Authorized" }
    end
  end
end
