class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @dashboard = Dashboard.new
  end

end
