class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if current_user
      if current_user.admin?
        admin_dashboard_path
      else
        root_path
      end
    end
  end

  def user_dashboard
    puts "INN"
    puts current_user.admin
    if current_user.admin?
      redirect_to admin_dashboard_path
    end
  end

end
