class MessagesController < ApplicationController
  def index
    @messages = Message.where(chat_id: params[:chat_id])
    render json: @messages
  end

  def create
    @message = Message.create( message_params )
    render json: @message
  end

  def message_params
    params.require(:message).permit(:chat_id, :author_id, :author_type, :content) 
  end
end
