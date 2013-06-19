class DemoController < ApplicationController
  def create
    chat = Chat.create
    redirect_to demo_path(chat.id)
  end

  def show
    @chat = Chat.find(params[:id])
    @messages = @chat.messages
  end
end
