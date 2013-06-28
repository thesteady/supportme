class Admin::ChatsController < ApplicationController
  def index
    #is this the best way to to do this? one API call, then two selects?
    #or two API calls? is there a way to split the chats in one run?
    chats = ChatService.get_open_chats
    @waiting_chats = chats.select { |chat| chat.status == 'waiting' }
    @active_chats = chats.select { |chat| chat.status == 'active' }

    # @active_chats = []
    # @waiting_chats = []

    # chats.each do |chat|
    #   @active_chats << chat if chat.status == 'active'
    #   @waiting_chats << chat if chat.status == 'waiting'
    # end
    
    # @active_chats
    # @waiting_chats
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
