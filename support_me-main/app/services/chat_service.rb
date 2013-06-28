require 'net/http'

class ChatService
  attr_reader :chat_id

  def initialize(chat_id)
    @chat_id = chat_id
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

  def create(customer_id)
    data     = { "customer_id" => customer_id }
    path     = "/chats"
    response = ChatService.post(path, data)
    NewChat.new(response)
  end

  def fetch
    path     = "/chats/#{chat_id}"
    response = ChatService.get(path)
    NewChat.new(response)
  end

  def update_status(status)
    data     = { "status" => status }
    path     = "/chats/#{chat_id}"
    response = ChatService.put(path, data)
    NewChat.new(response)
  end

  def create_message(message_params)
    path     = "/chats/#{chat_id}/messages"
    response = ChatService.post(path, message_params)
    NewMessage.new(response)
  end

  def fetch_messages
    path     = "/chats/#{chat_id}/messages"
    response = ChatService.get(path)
    response.map { |message| NewMessage.new(message) }
  end
end