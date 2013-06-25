class ChatsController < ApplicationController
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

#get all messages for chat id
#post new message for chat id
#do i want to return all parts of the object?
