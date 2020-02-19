class PatientsController < ApplicationController
  before_action :authenticate_patient!
  def index
  end

  def show
  end

  def new
  end

  def profile
  end

  def calendar
    @appointments = Appointment.where(patient_email: current_patient.email).or(Appointment.where(practice_email: params[:prac]))
    @appointments.each do |app|
      logger.debug(app)
    end
    @practices = Practice.all
    @doctor_choices = {
      "Select a practice" => ""
    }

    @practices.each do |practice|
      @doctor_choices.store(practice.first_name + " " + practice.last_name, practice.email)
    end
    if (params.has_key?(:prac))
       $prac = params[:prac]
       @prac = @doctor_choices.key($prac)
    else
      $prac = @doctor_choices.values[0]
      @prac = nil
    end
    logger.debug($prac)

    @appointment = current_patient.appointments.build

  end


end
