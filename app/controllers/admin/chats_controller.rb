class Admin::ChatsController < ApplicationController
  def index
    require_login
    @waiting_chats = Chat.where(status: 'waiting')
    @active_chats = Chat.where(status: 'active')
  end

  def show
    @chat = Chat.find(params[:id])
    #should also update user_id attribute here... will require log in.
    @chat.update_attributes(status: 'active') if @chat.status == 'waiting'
    @messages = @chat.messages
  end
end
