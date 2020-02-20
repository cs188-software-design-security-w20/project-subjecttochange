class PracticesController < ApplicationController
  before_action :authenticate_practice!

  def index
  end

  def show
  end

  def new
  end

  def profile
  end

  def calendar
   @appointments = Appointment.where(practice_email: current_practice.email)
  end

end
