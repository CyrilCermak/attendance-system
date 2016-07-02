class AdminController < ApplicationController
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :is_user_admin?

  def is_user_admin?
    unless current_user && current_user.admin?
      redirect_to root_path
    end
  end
end