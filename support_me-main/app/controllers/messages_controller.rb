class MessagesController  < ApplicationController
  def create

    service  = ChatService.new(params[:message][:chat_id])

    @message = service.create_message(params)

    @chat_id = @message.chat_id

    respond_to do |format|
      #format.html { redirect_to admin_chat_path(@message.chat_id)}
      format.js {@message}
    end
  end
end
