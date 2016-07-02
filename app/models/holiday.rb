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

class Holiday < ActiveRecord::Base
  validates :name,presence:  true
  validates :start, presence: true
  validates :end, presence: true
  validates :worker, presence: true
  belongs_to :worker
  include HolidaysHelper
end
