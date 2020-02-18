class AppointmentsController < ApplicationController
  before_action :authenticate_patient! 


  def create
	  @appointment = Appointment.new(appointment_params)
    @appointment.patient_email = current_patient.email
    @appointment.duration = 1

    @appointments = Appointment.where(patient_email: current_patient.email).or(Appointment.where(practice_email: "doctor@gmail.com"))
    @appointments.each do |appointment|
    if @appointment != appointment
      if appointment.appt_start <= @appointment.appt_start && @appointment.appt_start < appointment.end_time || @appointment.appt_start <= appointment.appt_start && appointment.appt_start < @appointment.end_time
        flash[:failure] = "Appointment time slot already full, appointment not created"
        redirect_to '/calendar'
        return
      end
     end
    end



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
