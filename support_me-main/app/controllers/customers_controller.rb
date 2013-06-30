class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    customer = Customer.find_or_create_by_name_and_email(params[:customer])

    if customer.save
      session[:customer_id] = customer.id

      service = ChatService.new
      chat    = service.create_chat(customer.id)

      redirect_to admin_chat_path(chat.id)
    else
      redirect_to new_customer_path
    end
  end
end
