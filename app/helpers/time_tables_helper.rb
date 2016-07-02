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

module TimeTablesHelper

  def start_time
    self.start.localtime.strftime("%H:%M %A")
  end

  def end_time
    self.end.localtime.strftime("%H:%M %A")
  end

end
