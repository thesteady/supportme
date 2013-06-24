class Admin::ChatsController < ApplicationController
  
  before_filter :require_login

  def index
    @waiting_chats = Chat.where(status: 'waiting')
    @active_chats = Chat.where(status: 'active')
  end

  def show
    @chat = Chat.find(params[:id])
    @chat.update_attributes(status: 'active') if @chat.status == 'waiting'
    @messages = @chat.messages
  end

  def update
    @chat = Chat.find(params[:id])
    @chat.update_attributes(status: 'resolved') if @chat.status == 'active'
    flash[:notice] = 'Thanks for helping out!'
    redirect_to admin_chats_path
  end
end
