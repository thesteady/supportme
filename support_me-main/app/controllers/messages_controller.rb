class MessagesController  < ApplicationController
  def create
    
    puts params.inspect

    service  = ChatService.new(params[:message][:chat_id])
    @message = service.create_message(params)
    @chat_id = @message.chat_id

    respond_to do |format|
      format.js {@message}
    end
  end

  def index
    service   = ChatService.new(params[:chat_id])
    @messages = service.fetch_messages

    respond_to do |format|
      format.json { render :json => @messages }
    end
  end
end
