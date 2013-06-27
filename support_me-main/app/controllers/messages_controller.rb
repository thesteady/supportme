class MessagesController  < ApplicationController
  def create
    @message = ChatService.create_message(params)

   #timeout
#helper method to send to chat serivce for x seconds, rescue timeout exception, contineu on.

   #this is where we start again.
    @message = Message.create(params[:message])
    @chat = @message.chat

    respond_to do |format|
      format.html { redirect_to admin_chat_path(@message.chat_id)}
      format.js {@message}
    end
  end
end
