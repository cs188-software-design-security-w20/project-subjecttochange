class NotificationsController < ApplicationController
  before_action :authenticate_patient!
  before_action :set_notifications

  def index
  end

  private

  def set_notifications
    puts("[NotificationsController] My current patient is #{current_patient}")
    puts("[NotificationsController] My current patient's email is #{current_patient.email}")
    @notifications = Notification.where(recipient_id: current_patient.id).unread
    puts("[NotificationsController] I have notifications of #{@notifications}")
    puts("[NotificationsController] First notification is #{@notifications[0]}")
  end

end
