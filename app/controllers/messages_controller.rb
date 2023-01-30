# frozen_string_literal: true

class MessagesController < ApplicationController
  def create
    @message = current_user.messages.create(text: msg_params[:text], chat_id: params[:chat_id])
  end

  private

  def msg_params
    params.require(:message).permit(:text)
  end
end
