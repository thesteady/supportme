class SessionsController < ApplicationController
  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_to admin_chats_path
    else
      redirect_to root_path, alert: "Email or password was invalid."
    end
  end

  def destroy
    logout
    redirect_to root_path, :notice => "Logged out."
  end
end
