class DemoController < ApplicationController
  def create
    customer = Customer.find_or_create_by_name_and_email(
                                 name: 'Demo Customer',
                                 email: 'demo_customer@supportme.com'
                                )
    chat = customer.chats.create
    redirect_to demo_path(chat.id)
  end

  def show
    @chat = Chat.find(params[:id])
    @messages = @chat.messages
  end
end
