class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor

  validates :date, presence: true
  validates :city, presence: true
  validates :user_name, presence: true
end
