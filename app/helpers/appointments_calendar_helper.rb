module AppointmentsCalendarHelper

  def appointment_position(appointment)
    "top: #{ ( ( (appointment.appt_start - appointment.appt_start.midnight)/3600 - 8 ) * 40 ) + 28}px;"
  end

  def appointment_height(appointment)
    "height: #{1 * 40/3600}px;"
  end

  def highlight_appointment(appointment)
    if current_page?( appointments_path(appointment))
      " highlight"
    end
  end

  def appointment_text(appointment)
    "<span class='name'>#{appointment.practice_email} <br> at #{appointment.start_time.strftime("%l:%M %p")} </span>".html_safe
  end

end
