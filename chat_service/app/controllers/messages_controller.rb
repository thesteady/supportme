class MessagesController < ApplicationController
  def index
    @messages = Message.where(chat_id: params[:chat_id])
    render json: @messages
  end

  def create
    @message = Message.create(params)
    render json: @message
  end
end
