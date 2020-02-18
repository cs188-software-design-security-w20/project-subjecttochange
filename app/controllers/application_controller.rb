class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #Allow new registration fields to be included in Devise.
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    #Configure Devise Registration
    def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name,
              :middle_initial, :last_name, :email, :password, :med_school, :phone_number, :city, :state, :zipcode, :gender, :birthdate)}

            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name,
              :middle_initial, :last_name, :email, :password, :med_school, :phone_number, :city, :state, :zipcode, :gender, :birthdate, :current_password)}

    end

end
