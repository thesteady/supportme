class MessagesController  < ApplicationController

  def create
    @message = Message.create(params[:message])

    respond_to do |format|
      format.html { redirect_to chat_path(@message.chat_id)}
      format.js {@message}
    end
  end
end
