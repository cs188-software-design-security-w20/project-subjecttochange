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
    # Get a list of all of the appointments for the current practice
    @appointments = Appointment.where(practice_email: current_practice.email)

    # Create a new appointment when the practice clicks create
    @appointment = current_practice.appointments.build
  end

end
