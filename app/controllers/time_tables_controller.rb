class Admin::TimeTablesController < AdminController
  before_filter :authenticate_user!

  def show
    @worker = Worker.find_by(id: params[:id])
    @time_tables = @worker.time_tables
  end

  def calendar_data
    @worker = Worker.find_by(id: params[:id])
    @time_tables = @worker.time_tables
  end

end
