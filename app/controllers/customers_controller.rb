class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    customer = Customer.first_or_create(params[:customer])

    if customer.save
      chat = customer.chats.create
      redirect_to chat_path(chat.id)
    else
      redirect_to new_customer_path
    end
  end
end