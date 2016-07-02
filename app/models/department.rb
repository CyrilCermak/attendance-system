# == Schema Information
#
# Table name: departments
#
#  id           :integer          not null, primary key
#  name         :string
#  floor        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  positions_id :integer
#

class Department < ActiveRecord::Base
  has_many :positions

  validates :name, uniqueness: true, presence: true
end
