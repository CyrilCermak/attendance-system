module API::Helpers
  extend Grape::API::Helpers
  x = 10
  def current_user(test)
    @user ||= User.find_by(token: params[:token])
  end

  def authenticate!
    white_list = ["/api/users/login"]
    resource_path = "#{self.request.env['SCRIPT_NAME']}#{self.request.env['PATH_INFO']}"
    unless white_list.include? resource_path
      unless current_user
        error! "Not logged in.", 401
      end
    end
  end

end

#test