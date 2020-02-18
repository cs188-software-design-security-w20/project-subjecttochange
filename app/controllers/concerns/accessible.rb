module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    if current_practice
      flash.clear
      redirect_to(authenticated_practice_root_path) and return
    elsif current_patient
      flash.clear
      redirect_to(authenticated_patient_root_path) and return
    end
  end
end
