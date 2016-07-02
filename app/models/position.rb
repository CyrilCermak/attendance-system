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

class Position < ActiveRecord::Base
  belongs_to :department
  has_many :workers

  validates :name, presence: true, uniqueness: true
end
