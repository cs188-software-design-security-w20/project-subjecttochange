class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable, :confirmable,
  has_many :appointments, :class_name => 'Appointment', :foreign_key => 'patient_email', dependent: :destroy
  devise :database_authenticatable, :registerable, :rememberable, :timeoutable, :trackable, :lockable

  # validates :first_name, :last_name, :email, :phone_number, :city, :state, :zipcode, :birthdate, presence: true
  validates :email, uniqueness: true

  has_many :medical_records
  has_many :notifications, foreign_key: :recipient_id

end
