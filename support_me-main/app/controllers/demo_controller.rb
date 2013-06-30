class DemoController < ApplicationController
  def create
    customer = Customer.find_or_create_by_name_and_email(
      name:  'Demo Customer',
      email: 'demo_customer@supportme.com'
      )

    service = ChatService.new
    chat    = service.create_chat(customer.id)

    redirect_to demo_path(chat.id)
  end

  def show
    service   = ChatService.new(params[:id])
    @chat     = service.fetch_chat
    @messages = service.fetch_messages
  end
end