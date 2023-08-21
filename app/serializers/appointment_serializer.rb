class AppointmentSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :doctor_id, :city, :date
    belongs_to :user
    belongs_to :doctor
end