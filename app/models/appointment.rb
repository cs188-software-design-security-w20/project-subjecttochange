class Appointment < ApplicationRecord
	validates :patient_email, presence: true
	validates :practice_email, presence: true
	validates :appt_start, presence: true
	validates :duration, numericality: { only_integer: true }
	validates :description, length: { maximum: 140 }

	validate :appointment_date_cannot_be_in_the_past

  def appointment_date_cannot_be_in_the_past
    if appt_start.present? && appt_start < Date.today
      errors.add(:appt_start, " date can't be in the past")
    end
  end

  def start_time
    self.appt_start
  end

  def end_time
    (self.appt_start.to_time + 1.hours).to_datetime
  end

end