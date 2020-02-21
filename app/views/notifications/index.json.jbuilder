puts("test1")
puts(@notifications.class)
puts(@notifications.nil?)
puts("test2")
puts(@notifications[0].nil?)

json.array! @notifications do |notification|

  appointment_class = Object.const_get(notification.notifiable_type)
  if appointment_class.exists?(id: notification.notifiable_id)
    # json.recipient notification.recipient  # Don't actually need this, since recipient is you
    json.actor notification.actor
    json.action notification.action
    json.notifiable notification.notifiable
    json.notifiable_type notification.notifiable_type
    #json.url
  end


end




#json.array! @notifications do |notification|
#  puts(current_patient.email)
#  puts("test11")
#  json.id notification.id
#  if notification.notifiable_type.nil? || notification.action.start_with?('<message>')
#    json.template render partial: "notifications/nil/message", locals: {notification: notification}, formats: [:html]
#  else
#    #json.template render partial: "notifications/#{notification.notifiable_type.underscore.pluralize}/#{notification.action}", locals: {notification: notification}, formats: [:html]
#    json.template render partial: "notifications/#{notification.notifiable_type.underscore.pluralize}/generic", locals: {notification: notification}, formats: [:html]
#  end
#
#
#end