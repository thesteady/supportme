require 'net/http'

class ChatService
  def self.create(customer_id)
    data = {"customer_id" => customer_id}
    NewChat.new  post("/chats", data)
  end

  def self.connection
    @connection ||= Faraday.new("http://localhost:3000")
  end

  def self.post(path, data)
    response = connection.post(path, data)
    JSON.parse(response.body)
  end

  def self.get(path)
    response = connection.get(path)
    JSON.parse(response.body)
  end

  def self.put(path, data)
    response = connection.put(path, data)
    JSON.parse(response.body)
  end

  attr_reader :chat_id

  def initialize(chat_id)
    @chat_id = chat_id
  end

   def fetch
    response = ChatService.get("/chats/#{chat_id}")
    NewChat.new response
  end

  def update_status(status)
    data = {"status" => status}
    response = ChatService.put("/chats/#{chat_id}", data)
    NewChat.new(response)
  end

  def create_message(message_params)
    path = "/chats/#{chat_id}/messages"
    response = ChatService.post(path, message_params)
    NewMessage.new(response)
  end

  def fetch_messages
    path = "/chats/#{chat_id}/messages"
    response = ChatService.get(path)
    response.map {|message| NewMessage.new(message)}
  end

end
