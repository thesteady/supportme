class Admin::ChatsController < ApplicationController
  def index
    # require_login
    @waiting_chats = Chat.where(status: 'waiting')
    @active_chats = Chat.where(status: 'active').order("updated_at ASC")
  end

  def show
    @chat = ChatService.fetch(params[:id])
    #require_customer
    ChatService.update_status(chat_id, status) if status == 'waiting'
    @messages = @chat.messages
  end

  def update
    require_login

    @chat = Chat.find(params[:id])
    @chat.update_attributes(status: 'resolved') if @chat.status == 'active'
    flash[:notice] = 'Thanks for helping out!'
    redirect_to admin_chats_path
  end

  private

  def require_customer
    customer ||= Customer.where(id: session[:customer_id]).first
    redirect_to root_path if customer.nil?
  end
end
