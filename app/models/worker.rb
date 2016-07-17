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

class Worker < User
  belongs_to :user
  belongs_to :position
  has_many :time_tables
  has_many :holidays

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :mac, uniqueness: true
  # validates :phone, phone: true, presence: false

  include WorkersHelper

  def status_changed(state)
    if state
      record = TimeTable.create!(start: Time.now, end: nil ,worker: self)
      self.time_tables << record
    else
      record = self.time_tables.last
      record.end = Time.now
      record.save!
    end
    self.state = state
    self.save!
  end

  def to_s
    self.full_name
  end


end
