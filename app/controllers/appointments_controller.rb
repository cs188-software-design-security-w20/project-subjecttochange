class AppointmentsController < ApplicationController



  def create
    # get appointment params
    # the duration param is actually the time slot
    # get time slot , then set the rest of the parameters that were not passed in
    if (current_patient)
      @appointment = Appointment.new(appointment_params)
      duration = @appointment.duration
      @appointment.patient_email = current_patient.email
      @appointment.duration = 1
      @appointment.practice_email = $prac

      if (duration < 8)
        duration = duration + 12
      end

      # reset the datetime to account for hour of appointment
      # set end time to be one hour after the start time
      date = @appointment.appt_start
      @appointment.appt_start = (date.to_time + duration.hours).to_datetime
      end_time = (@appointment.appt_start.to_time + 1.hours).to_datetime

      # go through all apointments for current patient and the practice and make sure the times do not overlap
      @appointments = Appointment.where(patient_email: current_patient.email).or(Appointment.where(practice_email: $prac))
      @appointments.each do |appointment|
      appt_endtime = (appointment.appt_start.to_time + 1.hours).to_datetime
      if @appointment != appointment
        if appointment.appt_start <= @appointment.appt_start && @appointment.appt_start < appt_endtime|| @appointment.appt_start <= appointment.appt_start && appointment.appt_start < end_time
          flash[:failure] = "Appointment time slot already full, appointment not created"
          redirect_to '/calendar'
          return
        end
       end
      end

      # Try saving appointment, if it is saved notify a success, otherwise a failure
      if @appointment.save
        flash[:success] = "Appointment created!"
        redirect_to '/calendar'
      else
        flash[:failure] = "Appointment not created"
        redirect_to '/calendar'
      end
     elsif (current_practice)
      @appointment = Appointment.new(appointment_params)
      duration = @appointment.duration
      @appointment.patient_email = "NONE"
      @appointment.duration = 1
      @appointment.practice_email = current_practice.email

      if (duration < 8)
        duration = duration + 12
      end

      # reset the datetime to account for hour of appointment
      # set end time to be one hour after the start time
      date = @appointment.appt_start
      @appointment.appt_start = (date.to_time + duration.hours).to_datetime
      end_time = (@appointment.appt_start.to_time + 1.hours).to_datetime

      # go through all apointments for current patient and the practice and make sure the times do not overlap
      @appointments = Appointment.where(practice_email: $prac)
      @appointments.each do |appointment|
      appt_endtime = (appointment.appt_start.to_time + 1.hours).to_datetime
      if @appointment != appointment
        if appointment.appt_start <= @appointment.appt_start && @appointment.appt_start < appt_endtime|| @appointment.appt_start <= appointment.appt_start && appointment.appt_start < end_time
          flash[:failure] = "Appointment time slot already full, appointment not created"
          redirect_to '/practicecalendar'
          return
        end
       end
      end

      # Try saving appointment, if it is saved notify a success, otherwise a failure
      if @appointment.save
        flash[:success] = "Appointment created!"
        redirect_to '/practicecalendar'
      else
        flash[:failure] = "Appointment not created"
        redirect_to '/practicecalendar'
      end
     end
  end

  def destroy
  end

  private

    def appointment_params
      params.require(:appointment).permit(:patient_email, :practice_email, :description, :appt_start, :duration)
    end
end
