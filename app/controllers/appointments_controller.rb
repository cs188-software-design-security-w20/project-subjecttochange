class AppointmentsController < ApplicationController



  def create
    # Create a new appointment
    # First see if it is a patient or practice signed in to create the appointment
    if (current_patient)
      # Create a new appointment with the parameters passed in
      @appointment = Appointment.new(appointment_params)
      duration = @appointment.duration

      # Set the patient email, duration, and practice email to the known parameters
      @appointment.patient_email = current_patient.email
      @appointment.duration = 1
      pr = Practice.where(id: $prac)
      @appointment.practice_email = pr.first.email

      if (duration < 8)
        duration = duration + 12
      end

      # Reset the datetime to account for hour of appointment
      # Set end time to be one hour after the start time
      date = @appointment.appt_start
      @appointment.appt_start = (date.to_time + duration.hours).to_datetime
      end_time = (@appointment.appt_start.to_time + 1.hours).to_datetime

      # Go through all apointments for current patient and the practice and make sure the times do not overlap
      @appointments = Appointment.where(patient_email: current_patient.email).or(Appointment.where(practice_email: @appointment.practice_email))
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
      # Create a new appointment for the practice
      @appointment = Appointment.new(appointment_params)
      duration = @appointment.duration

      # Set the patient_email, duration, and practice_email to the known paramters
      @appointment.patient_email = "NONE"
      @appointment.duration = 1
      @appointment.practice_email = current_practice.email

      if (duration < 8)
        duration = duration + 12
      end

      # Reset the datetime to account for hour of appointment
      # Set end time to be one hour after the start time
      date = @appointment.appt_start
      @appointment.appt_start = (date.to_time + duration.hours).to_datetime
      end_time = (@appointment.appt_start.to_time + 1.hours).to_datetime

      # Go through all apointments for current patient and the practice and make sure the times do not overlap
      @appointments = Appointment.where(practice_email: current_practice.email)
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
