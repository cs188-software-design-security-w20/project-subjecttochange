class Practice < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :confirmable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable, :trackable, :lockable

  # validates :first_name, :last_name, :email, :med_school, :phone_number, :city, :state, :zipcode, presence: true
  validates :email, uniqueness: true
end
