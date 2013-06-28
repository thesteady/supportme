require 'net/http'

class ChatService

  attr_reader :chat_id

  def initialize(chat_id)
    @chat_id = chat_id
  end

  def self.create(customer_id)
    data = {"customer_id" => customer_id}
    Chat.new  post("/chats", data)
  end

  def self.get_open_chats
    response = get("/chats")
    response.map { |chat| Chat.new(chat) }
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

  def fetch
    response = ChatService.get("/chats/#{chat_id}")
    Chat.new response
  end

  def update_status(status)
    data = {"status" => status}
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
    response.map {|message| Message.new(message)}
  end
end
