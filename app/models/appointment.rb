class Appointment < ApplicationRecord
	validates :patient_email, presence: true
	validates :practice_email, presence: true
	validates :appt_start, presence: true
	validates :duration, numericality: { only_integer: true }
	validates :description, length: { maximum: 140 }

	validate :appointment_date_cannot_be_in_the_past

   #belongs_to :patient
   #belongs_to :practice

   after_create :create_notifications
  # after_create puts("this is my notification!")


  after_initialize do |appointment|
    #puts("[Appointment.after_initialize] Patient email is #{patient_email}")
    #puts("[Appointment.after_initialize] Practice email is #{practice_email}")
    #@patient = Patient.find_by email: patient_email
    #puts("[Appointment.after_initialize] Patient is #{@patient}")
    #@practice = Practice.find_by email: practice_email
    #puts("[Appointment.after_initialize] Practice is #{@practice}")
  end

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



  private

  #def recipients
  #  patients = []
  #  return patients.push(@patient)
  #end

  def create_notifications
    puts("create_notifications test1")

    @patient = Patient.find_by email: patient_email
    @practice = Practice.find_by email: practice_email

    puts("[Appointment.create_notifications] Recipient is #{@patient}")
    puts("[Appointment.create_notifications] Actor is #{@practice}")

    n1 = Notification.create(recipient: @patient, actor: @practice,
                             action: 'scheduled', notifiable: self)
    puts("[Appointment.create_notifications] Notification n1 is #{n1}")

    #recipients.each do |recipient|
    #  puts("[Appointment.create_notifications] Recipient is #{recipient}")
    #  puts("[Appointment.create_notifications] Actor is #{@practice}")
    #  n1 = Notification.create(recipient: recipient.id, actor: @practice.id,
    #                      action: 'appointments set', notifiable: self)
    #  puts(n1)
    #  puts(n1.class)
    #end

    puts("create_notifications test2")
  end

end