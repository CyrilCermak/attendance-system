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

class Worker < ActiveRecord::Base
  belongs_to :position
  has_many :time_tables

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, length: {maximum: 255}, format:
      { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
  validates :mac, uniqueness: true

  def status_changed(state)
    if state
      record = TimeTable.create!(arrival: Time.now, departure: nil ,worker: self)
      self.time_tables << record
    else
      record = self.time_tables.last
      record.departure = Time.now
      record.save!
    end
    self.state = state
    self.save!
    true
  end

end
