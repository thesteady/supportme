class Admin::ChatsController < ApplicationController
  def index
    # require_login
    #will become fetches
    @waiting_chats = Chat.where(status: 'waiting')
    @active_chats = Chat.where(status: 'active').order("updated_at ASC")
  end

  def show
    chatservice = ChatService.new(params[:id])
    @chat = chatservice.fetch

    chatservice.update_status('active') if @chat.status == 'waiting'
    chatservice.fetch_messages
  end

  def update
    require_login

    chatservice = ChatService.new(params[:id])
    @chat = chatservice.fetch
    chatservice.update_status('resolved') if @chat.status == 'active'

    flash[:notice] = 'Thanks for helping out!'
    redirect_to admin_chats_path
  end

  private

  def require_customer
    customer ||= Customer.where(id: session[:customer_id]).first
    redirect_to root_path if customer.nil?
  end
end
