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

require 'test_helper'

class HolidayTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
