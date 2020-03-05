class Practice < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :confirmable,
  has_many :appointments, :class_name => 'Appointment', :foreign_key => 'practice_email', dependent: :destroy
  devise :database_authenticatable, :registerable, :rememberable, :timeoutable, :trackable, :lockable

  # validates :first_name, :last_name, :email, :med_school, :phone_number, :city, :state, :zipcode, presence: true
  validates :email, uniqueness: true
  has_many :medical_records
end
