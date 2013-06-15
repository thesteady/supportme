class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:notice] = "You are account was created."
    else
      flash[:alert]  = "Your account could not be created."
    end

    redirect_to root_url
  end
end