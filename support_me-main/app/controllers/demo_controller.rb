class DemoController < ApplicationController
  def create
    customer = Customer.find_or_create_by_name_and_email(
                                 name: 'Demo Customer',
                                 email: 'demo_customer@supportme.com'
                                )
    chat = ChatService.create_chat(customer.id)
    redirect_to demo_path(chat.id)
  end

  def show
    chatservice = ChatService.new(params[:id])
    @chat = chatservice.fetch_chat

    @messages = chatservice.fetch_messages
  end
end
