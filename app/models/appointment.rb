class Appointment < ApplicationRecord
	validates :patient_email, presence: true
	validates :practice_email, presence: true
	validates :appt_start, presence: true
	validates :description, length: { maximum: 140 }
end