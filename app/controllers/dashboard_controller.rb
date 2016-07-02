class DashboardController < ApplicationController
  before_filter :authenticate_user!
  before_filter :user_dashboard

  def index
    @workers = Worker.all
  end

  def show_worker
    @worker = Worker.find_by(id: params[:id])
  end

end
