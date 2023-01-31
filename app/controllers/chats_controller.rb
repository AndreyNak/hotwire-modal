# frozen_string_literal: true

class ChatsController < ApplicationController
  def index
    @chats = Chat.all
    @users = User.all_except(current_user)
    @notificatios = Message.all
  end

  def show
    @single_chat = Chat.find(params[:id])
    @chats = Chat.all
    @message = Message.new

    render 'index'
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(chat_params)

    respond_to do |format|
      if @chat.save
        format.html { redirect_to chat_path(@chat.id) }

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:name)
  end
end
