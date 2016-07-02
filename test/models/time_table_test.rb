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

require 'test_helper'

class TimeTableTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
