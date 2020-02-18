class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable, :confirmable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable, :trackable, :lockable

  # validates :first_name, :last_name, :email, :phone_number, :city, :state, :zipcode, :birthdate, presence: true
  validates :email, uniqueness: true

  has_many :medical_records
end
