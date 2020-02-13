class AppointmentsController < ApplicationController
  before_action :authenticate_patient! 


  def create
	  @appointment = Appointment.new(appointment_params)
    @appointment.patient_email = current_patient.email
    
    if @appointment.save  
      flash[:success] = "Appointment created!"
      redirect_to root_path, :flash => { :success => "Appointment created!" }
    else
      flash[:failure] = "Appointment not created"
      render 'patients/show'
    end
  end

  def destroy
  end

  private

    def appointment_params
      params.require(:appointment).permit(:patient_email, :practice_email, :description, :appt_start, :duration)
    end
end
