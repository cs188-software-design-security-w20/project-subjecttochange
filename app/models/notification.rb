class Notification < ApplicationRecord
  belongs_to :recipient, class_name: 'Patient'
  belongs_to :actor, class_name: 'Practice'
  belongs_to :notifiable, polymorphic: true

  scope :unread, -> { where(read_at: nil) }

  def to_s
    "<Notification id: #{id}, recipient: #{recipient_id}, actor: #{actor_id}, read_at: #{read_at}, action: #{action}," +
        " notifiable: #{notifiable_id}, notifiable_type: #{notifiable_type}>"
  end
end
