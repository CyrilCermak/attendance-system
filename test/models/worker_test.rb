# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#  token                  :string
#  admin                  :boolean          default(FALSE)
#  first_name             :string
#  last_name              :string
#  mac                    :string
#  ip                     :string
#  state                  :boolean
#  host_name              :string
#  position_id            :integer
#  time_tables_id         :integer
#  type                   :string
#

require 'test_helper'

class WorkerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
