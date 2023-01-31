# frozen_string_literal: true

class MessageNotification < Noticed::Base
  deliver_by :database

  param :message

  def message
    @chat = Chat.find(params[:message].chat_id)
    @message = Message.find(params[:message].id)
    @user = User.find(@message.user_id)

    "wrote '#{@message.text}' in #{@chat.name} chat"
  end

  def url
    chat_path(Chat.find(params[:message].chat_id))
  end
end
