# frozen_string_literal: true

class Message < ApplicationRecord
  has_noticed_notifications

  belongs_to :user
  belongs_to :chat

  after_create_commit { broadcast_append_to chat }

  after_create_commit :notify_recipients

  def notify_recipients
    User.all_except(user).find_each do |recipient|
      MessageNotification.with(message: self).deliver_later(recipient)
    end
  end
end
