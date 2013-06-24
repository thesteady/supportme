class Admin::ChatsController < ApplicationController
  def index
    require_login
    @waiting_chats = Chat.where(status: 'waiting')
    @active_chats = Chat.where(status: 'active')
  end

  def show
    customer ||= Customer.where(id: session[:customer_id]).first

    if customer
      @chat = Chat.find(params[:id])
      @chat.update_attributes(status: 'active') if @chat.status == 'waiting'
      @messages = @chat.messages
    else
      redirect_to root_path
    end
  end
end