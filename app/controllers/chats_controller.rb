class ChatsController < ApplicationController
  def index
  end

  def create
    chat = Chat.create
    redirect_to chat_path(chat.id)
  end

  def show
    @chat = Chat.find(params[:id])
  end
end
