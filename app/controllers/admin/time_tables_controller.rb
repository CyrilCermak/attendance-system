class TimeTablesController < ApplicationController
  before_filter :authenticate_user!
  def show
    @worker = Worker.find_by(params[:id])
    @time_tables = @worker.time_tables
  end
end
