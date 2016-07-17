class Admin::AttendanceController < AdminController

  def index
    if params[:time_table] == nil
      @worker = Worker.new
    else
      @worker = Worker.find_by(id: params[:time_table][:worker_id])
    end
    @workers = Worker.all
  end

end
