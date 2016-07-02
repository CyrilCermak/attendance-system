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

class TimeTable < ActiveRecord::Base
  belongs_to :worker

  validates :start ,presence: true
  validates :worker_id, presence: true

  include TimeTablesHelper

end
