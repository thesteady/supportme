class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
  end
end