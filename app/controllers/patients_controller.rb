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

    # Get appointments of all current patient and all appointments of the practice seleced
    @appointments = Appointment.where(patient_email: current_patient.email).or(Appointment.where(practice_email: params[:prac]))

    # Get all of the practices signed in
    @practices = Practice.all

    # Make a list of all of the practices to display to the user
    @doctor_choices = {
      "Select a practice" => ""
    }

    @practices.each do |practice|
      @doctor_choices.store(practice.first_name + " " + practice.last_name, practice.id)
    end

    # If the user selected a practice to display, make sure to save this practice
    if (params.has_key?(:prac))
      $prac = params[:prac]
      @prac = @doctor_choices.key($prac)
    else
      $prac = @doctor_choices.values[0]
      @prac = nil
    end

    # Create the new appointment when a user clicks "Create Appointment"
    @appointment = current_patient.appointments.build

  end


end
