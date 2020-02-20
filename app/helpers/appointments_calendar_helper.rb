module AppointmentsCalendarHelper

  def appointment_belongs_to_patient(appointment)
    if (appointment.patient_email == current_patient.email)
      " patient-app"
    else
      " other-app"
    end
  end

  def highlight_appointment(appointment)
    if current_page?( appointments_path(appointment))
      " highlight"
    end
  end

  def appointment_text(appointment)
    practice = Practice.all
    first = ""
    last = ""
    practice.each do |pr|
      if (pr.email == appointment.practice_email)
        first = pr.first_name
        last = pr.last_name
      end
    end
    if (appointment.patient_email == current_patient.email)
      "<span class='name'> Appointment with #{first} #{last}  <br> at #{appointment.start_time.strftime("%l:%M %p")} <br> #{appointment.description}</span>".html_safe
    else
      "<span class='name'> #{first} #{last} is busy <br> at #{appointment.start_time.strftime("%l:%M %p")} </span>".html_safe
    end

  end

  def appointment_text_practice(appointment)
    practice = Patient.all
    first = ""
    last = ""
    practice.each do |pr|
      if (pr.email == appointment.patient_email)
        first = pr.first_name
        last = pr.last_name
      end
    end
    if (appointment.patient_email == "NONE")
       "<span class='name'> Busy at #{appointment.start_time.strftime("%l:%M %p")} <br> #{appointment.description} </span>".html_safe
    else
       "<span class='name'> Appointment with #{first} #{last} at #{appointment.start_time.strftime("%l:%M %p")} </span>".html_safe
    end
  end

end
