class NewMessage
  attr_reader :author_id,
              :author_type,
              :chat_id,
              :content

  def initialize(params)
    @author_id   = params[:author_id]
    @author_type = params[:author_type]
    @chat_id     = params[:chat_id]
    @content     = params[:content]
  end
end
