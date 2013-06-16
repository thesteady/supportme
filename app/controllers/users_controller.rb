class UsersController < ApplicationController
  def create
    user = User.new(params[:user])

    if user.save
      flash[:notice] = "Your account was created."
      redirect_to chats_path
    else
      flash[:alert]  = "Your account could not be created."
      redirect_to root_url
    end
  end
end
