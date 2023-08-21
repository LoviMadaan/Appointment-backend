class AppointmentSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :doctor_id, :city, :appointment_time
    belongs_to :user
    belongs_to :doctor
end