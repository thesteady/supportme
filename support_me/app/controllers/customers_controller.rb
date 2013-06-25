class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    customer = Customer.first_or_create(params[:customer])

    if customer.save
      session[:customer_id] = customer.id
      
      chat = ChatService.new.create(customer.id)
      
      redirect_to admin_chat_path(chat.id)
    else
      redirect_to new_customer_path
    end
  end
end
