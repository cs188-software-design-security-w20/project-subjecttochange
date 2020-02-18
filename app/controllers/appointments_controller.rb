class AppointmentsController < ApplicationController
  before_action :authenticate_patient! 


  def create
	  @appointment = Appointment.new(appointment_params)
    @appointment.patient_email = current_patient.email
    @appointment.duration = 1
    
    if @appointment.save  
      flash[:success] = "Appointment created!"
      redirect_to '/calendar'
    else
      flash[:failure] = "Appointment not created"
      redirect_to '/calendar'
    end
  end

  def destroy
  end

  private

    def appointment_params
      params.require(:appointment).permit(:patient_email, :practice_email, :description, :appt_start, :duration)
    end
end
