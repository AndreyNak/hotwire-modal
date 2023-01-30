# frozen_string_literal: true

class ChatsController < ApplicationController
  before_action :set_chat, only: %i[ show edit update destroy]

  def index
    @chats = Chat.all
    @users = User.all_except(current_user)
    @notificatios = Message.all
  end

  def show
    @single_chat = Chat.find(params[:id])
    @chats = Chat.all
    @users = User.all_except(current_user)
    @chat = Chat.new
    @message = Message.new

    p "+=" * 20
    p @single_chat
    p "+=" * 20

    render 'index'
  end

  def new
    @chat = Chat.new
  end

  def edit
  end

  def create
    @chat = Chat.new(chat_params)

    respond_to do |format|
      if @chat.save
        format.html { redirect_to action: :index }

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @chat.update(chat_params)
        format.html { redirect_to chat_url(@chat), notice: "Chat was successfully updated." }
        format.json { render :show, status: :ok, location: @chat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @chat.destroy

    respond_to do |format|
      format.html { redirect_to chats_url, notice: "Chat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_chat
    @chat = Chat.find(params[:id])
  end

  def chat_params
    params.require(:chat).permit(:name)
  end
end
