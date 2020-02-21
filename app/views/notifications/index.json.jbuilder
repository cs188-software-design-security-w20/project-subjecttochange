json.array! @notifications do |notification|

  appointment_class = Object.const_get(notification.notifiable_type)
  if appointment_class.exists?(id: notification.notifiable_id)
    # json.recipient notification.recipient  # Don't actually need this, since recipient is you
    json.id notification.id
    json.actor notification.actor
    json.action notification.action
    json.notifiable notification.notifiable
    json.notifiable_type notification.notifiable_type
  end


end