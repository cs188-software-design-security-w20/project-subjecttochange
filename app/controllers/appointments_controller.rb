class AppointmentsController < ApplicationController
  before_action :authenticate_patient! 


  def create
    # get appointments params
    # the duration param is actually the time slot
    # get time slot , then set the rest of the parameters that were not passed in
	  @appointment = Appointment.new(appointment_params)
	  duration = @appointment.duration
    @appointment.patient_email = current_patient.email
    @appointment.duration = 1
    @appointment.practice_email = $prac


    # reset the datetime to account for hour of appointments
    # set end time to be one hour after the start time
    date = @appointment.appt_start
    @appointment.appt_start = (date.to_time + duration.hours).to_datetime
    end_time = (@appointment.appt_start.to_time + 1.hours).to_datetime

    # go through all apointments for current patient and the practice and make sure the times do not overlap
    puts("[AppointmentsController] line 1")
    @appointments = Appointment.where(patient_email: current_patient.email).or(Appointment.where(practice_email: $prac))
    puts("[AppointmentsController] line 2")
    @appointments.each do |appointment|
      puts("[AppointmentsController] line 3")
    appt_endtime = (appointment.appt_start.to_time + 1.hours).to_datetime
      puts("[AppointmentsController] line 4")
    if @appointment != appointment
      puts("[AppointmentsController] line 5")
      if appointment.appt_start <= @appointment.appt_start && @appointment.appt_start < appt_endtime|| @appointment.appt_start <= appointment.appt_start && appointment.appt_start < end_time
        puts("[AppointmentsController] line 6")
        flash[:failure] = "Appointment time slot already full, appointments not created"
        puts("[AppointmentsController] line 7")
        redirect_to '/calendar'
        return
      end
     end
    end

    puts("[AppointmentsController] line 8")
    # Try saving appointments, if it is saved notify a success, otherwise a failure
    if @appointment.save
      puts("[AppointmentsController] line 9")
      flash[:success] = "Appointment created!"
      redirect_to '/calendar'
    else
      puts("[AppointmentsController] line 10")
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
