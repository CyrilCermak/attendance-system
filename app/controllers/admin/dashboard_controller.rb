class Admin::DashboardController < AdminController


  def index
    @workers = Worker.all
    @workers_at_work = Worker.where(state: true)
    @workers_out_of_work = Worker.where(state: false)
    @holidays = Holiday.where("start < ? and end >  ? ", Time.now, Time.now)
    @this_month_holidays =  Holiday.where("cast(strftime('%m', start) as int) = ?", Time.now.month) - @holidays
    @holidays_to_review = Holiday.where(reviewed: false)
  end

  def show_worker
    @worker = Worker.find_by(id: params[:id])
  end

end
