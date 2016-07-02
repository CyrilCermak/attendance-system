# == Schema Information
#
# Table name: time_tables
#
#  id         :integer          not null, primary key
#  start      :datetime
#  end        :datetime
#  worker_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TimeTablesController < ApplicationController

  def show
    @worker = Worker.find_by(id: params[:id])
    @time_tables = @worker.time_tables
  end

  def calendar_data
    @worker = Worker.find_by(id: params[:id])
    @time_tables = @worker.time_tables
  end

end
