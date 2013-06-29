class ChatService
  extend Client

  attr_reader :chat_id

  def initialize(chat_id = 0)
    @chat_id = chat_id
  end

  def create_chat(customer_id)
    path        = "/chats"
    chat_params = { "customer_id" => customer_id }
    response    = ChatService.post(path, chat_params)
    Chat.new(response)
  end

  def fetch_chat
    response = ChatService.get("/chats/#{chat_id}")
    Chat.new(response)
  end

  def fetch_chats
    response = ChatService.get("/chats")
    response.map { |chat| Chat.new(chat) }
  end

  def update_status(status)
    data     = { "status" => status }
    response = ChatService.put("/chats/#{chat_id}", data)
    Chat.new(response)
  end

  def create_message(message_params)
    path     = "/chats/#{chat_id}/messages"
    response = ChatService.post(path, message_params)
    Message.new(response)
  end

  def fetch_messages
    path     = "/chats/#{chat_id}/messages"
    response = ChatService.get(path)
    response.map { |message| Message.new(message) }
  end
end