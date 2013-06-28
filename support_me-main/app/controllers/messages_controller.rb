class MessagesController  < ApplicationController
  def create
    #check this!
    chatservice = ChatService.new(params[:message][:chat_id])
    @message = chatservice.create_message(params)
    # @message = ChatService.create_message(params)

   #timeout
#helper method to send to chat serivce for x seconds, rescue timeout exception, contineu on.
    @chat_id = @message.chat_id

    respond_to do |format|
      format.html { redirect_to admin_chat_path(@message.chat_id)}
      format.js {@message}
    end
  end
end
