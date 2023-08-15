class Doctor < ApplicationRecord
  belongs_to :user
  has_many :appointments, dependent: :destroy

  validates :name, presence: true
  validates :bio, presence: true
  validates :image, presence: true
end
