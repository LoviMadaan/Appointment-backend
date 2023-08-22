class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.order('created_at desc')
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

  def create
    @appointment = Appointment.new(appointment_params.merge(user_id: params[:user_id], doctor_id: params[:doctor_id]))
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
    params.require(:appointment).permit(:id, :user_name, :user_id, :doctor_id, :city, :date)
  end
end
