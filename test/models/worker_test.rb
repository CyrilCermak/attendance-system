# == Schema Information
#
# Table name: workers
#
#  id          :integer          not null, primary key
#  first_name  :string
#  last_name   :string
#  host_name   :string
#  ip          :string
#  mac         :string
#  state       :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  position_id :integer
#  email       :string
#

require 'test_helper'

class WorkerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
