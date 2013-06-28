class ChatsController < ApplicationController
  
  def index
    @chats = Chat.where(status: ['active', 'waiting'])

    render json: @chat
  end

  def create
    @chat = Chat.new
    @chat.customer_id = params.permit(:customer_id)[:customer_id]
    @chat.save

    render json: @chat 
  end

  def show
    @chat = Chat.find_by_id( params[:id] )
   
    render json: @chat
  end

  def update
    @chat = Chat.find_by_id( params[:id] )
    @chat.status = params.permit(:status)[:status]
    @chat.save

    render json: @chat
  end
end
