class PatientsController < ApplicationController
  before_action :authenticate_patient!
  def index
  end

  def show
  end

  def new
  end

  def calendar


    @appointment = current_patient.appointments.build
    @appointments = Appointment.where(patient_email: current_patient.email).or(Appointment.where(practice_email: "doctor@gmail.com"))
    .select("practice_email, appt_start")
  end


end
