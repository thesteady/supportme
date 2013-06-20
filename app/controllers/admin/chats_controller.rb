class Admin::ChatsController < ApplicationController
  def index
    @chats = Chat.where(status: 'waiting')
    @active_chats = Chat.where(status: 'active')
  end

  def show
    @chat = Chat.find(params[:id])
    @chat.update_attributes(status: 'active') if @chat.status == 'waiting'
    @messages = @chat.messages
  end
end