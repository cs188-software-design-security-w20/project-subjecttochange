class NotificationsController < ApplicationController
  before_action :authenticate_patient!
  before_action :set_notifications
  skip_before_action :verify_authenticity_token

  def index
    @notifications = Notification.where(recipient_id: current_patient.id).unread
  end

  def mark_as_read
    @notifications = Notification.where(recipient_id: current_patient.id).unread
    @notifications.update_all(read_at: Time.zone.now)
    render json: {success: true}
  end

  def create
    puts("[notifications_controller] create() called")
  end

  private

  def set_notifications
    @notifications = Notification.where(recipient_id: current_patient.id).unread
  end

end
