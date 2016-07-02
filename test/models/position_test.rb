# == Schema Information
#
# Table name: positions
#
#  id            :integer          not null, primary key
#  name          :string
#  wage          :integer
#  workers_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  department_id :integer
#

require 'test_helper'

class PositionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
