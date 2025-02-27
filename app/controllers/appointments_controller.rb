class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:edit, :update, :cancel]

  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
    @patients = Patient.all
    @doctors = Doctor.all
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to appointments_path, notice: 'Appointment booked successfully.'
    else
      @patients = Patient.all
      @doctors = Doctor.all
      render :new
    end
  end  

  def edit
    @patients = Patient.all
    @doctors = Doctor.all
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to appointments_path, notice: 'Appointment updated successfully.'
    else
      render :edit
    end
  end

  def cancel
    if @appointment.scheduled? && @appointment.appointment_date.future?
      @appointment.update(status: "canceled")
      flash[:notice] = "Appointment cancelled successfully."
    else
      flash[:alert] = "Cannot cancel past or already completed appointments."
    end
    redirect_to appointments_path
  end
  

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:patient_id, :doctor_id, :appointment_date, :status, :payment_status)
  end
end
