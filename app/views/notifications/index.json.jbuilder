puts("test1")
puts(@notifications.class)
puts(@notifications.nil?)
puts("test2")
puts(@notifications[0].nil?)
json.array! @notifications do |notification|
  puts(current_patient.email)
  puts("test11")
  json.id notification.id
  if notification.notifiable_type.nil? || notification.action.start_with?('<message>')
    json.template render partial: "notifications/nil/message", locals: {notification: notification}, formats: [:html]
  else
    json.template render partial: "notifications/#{notification.notifiable_type.underscore.pluralize}/#{notification.action}", locals: {notification: notification}, formats: [:html]
  end


end