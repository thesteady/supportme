class NewChat
  attr_reader :chat_id, :customer_id, :status
  
  def initialize(chat_service)
    @customer_id = chat_service["customer_id"]
    @chat_id = chat_service["customer_id"]
    @status = chat_service["status"]
  end
end
