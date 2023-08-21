class Api::V1::DoctorsController < ApplicationController
    def index
      @doctors = Doctor.includes(:appointments).order('created_at desc')
      if @doctors
        render json: { status: 'Success', data: @doctors, message: 'All doctors loaded succesfully'}, status: :ok
      else
        render json: @doctors.errors, status: :bad_request
      end
  
    end
  
    def show
      @doctor = Doctor.finc(params[:id])
      if @doctor
        render json: { status: 'Success', data: @doctors, message: 'Doctor successfully shown'}, status: :ok
      else 
        render json: @doctor.errors, status: :bad_request
    end
  
    def create
      @doctor = Doctor.new(doctor_params)
      if @doctor.
    end
  
    def destroy
    end
  
    def update
    end
  
    def doctor_params
      params.require(:doctor).permit(:name, :bio, :image)
    end
  end