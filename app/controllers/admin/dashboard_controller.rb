class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @workers = Worker.all
  end

  def show_worker
    @worker = Worker.find_by(id: params[:id])
  end
end
