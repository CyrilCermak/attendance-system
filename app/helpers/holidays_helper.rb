# == Schema Information
#
# Table name: holidays
#
#  id         :integer          not null, primary key
#  start      :datetime
#  end        :datetime
#  name       :string
#  reviewed   :boolean          default(FALSE)
#  worker_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

module HolidaysHelper

  def start_time
    self.start.localtime.strftime("%d.%m - %H:%M")
  end

  def end_time
    self.end.localtime.strftime("%d.%m - %H:%M")
  end

  def total_days
    ((self.end - self.start)/(60*60*24)).round(2)
  end

end
