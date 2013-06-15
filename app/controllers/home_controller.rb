class HomeController < ApplicationController
  def show
    if current_user
      redirect_to chats_path
    else
      @user = User.new
      render :show
    end
  end
end