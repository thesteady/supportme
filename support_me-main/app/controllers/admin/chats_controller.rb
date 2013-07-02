class Admin::ChatsController < ApplicationController
  def index
    require_login

    service = ChatService.new
    chats = service.fetch_chats

    #when we render a chat in the view, we need to get all existing messages for the chat
    #we also need to update this page with some polling to update the lists automatically


    @waiting_chats = chats.select { |chat| chat.status == 'waiting' }
    @active_chats  = chats.select { |chat| chat.status == 'active' }
  end

  def show
    service    = ChatService.new(params[:id])
    @chat      = service.fetch_chat
    @messsages = service.fetch_messages

    service.update_status('active') if @chat.status == 'waiting'
  end

  def update
    require_login

    service = ChatService.new(params[:id])
    @chat   = service.fetch_chat

    service.update_status('resolved') if @chat.status == 'active'
  end

  private

  def require_customer
    customer ||= Customer.find(id: session[:customer_id])
    redirect_to root_path if customer.nil?
  end
end
