class Appointment < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :patient_email, :practice_email, :appt_start, :duration, presence:true
  validates :description
before_action :logged_in_user, only: [:create, :destroy]

  def create
    @appointment = current_user.appointment.build(appointment_params)
    if @appointment.save
      flash[:success] = "Appointment created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def micropost_params
      params.require(:appointment).permit(:content)
    end


end
