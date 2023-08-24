class AppointmentsController < ApplicationController
  def index
    @appointments = current_user.appointments.includes(:doctor).order('created_at desc')
    if @appointments
      render json: @appointments, status: :ok
    else
      render json: @appointments.errors.full_messages, status: :bad_request
    end
  end

  def show
    @appointment = Appointment.where(id: params[:id])
    if @appointment
      render json: @appointment, status: :ok
    else
      render json: @appointment.errors.full_messages, status: :bad_request
    end
  end

  def new
    @doctor = Doctor.find(params[:doctor_id])
    @appoitment = @doctor.appointments.build
  end

  def create
    @doctor = Doctor.find(params[:doctor_id])
    @appointment = @doctor.appointments.build(appointment_params)
    @appointment.user = current_user
    if @appointment.save
      render json: @appointment, status: :created
    else
      render json: @appointment.errors.full_messages, status: :bad_request
    end
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update(appointment_params)
      render json: 'appointment updated successfully'
    else
      render json: @appointment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    if @appointment.destroy
      render json: 'appontment deleted succesfully'
    else
      render json: @appointment.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:city, :date)
  end
end
