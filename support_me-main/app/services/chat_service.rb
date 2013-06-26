require 'net/http'

class ChatService
  def create(customer_id)
    data = {"customer_id" => customer_id}

    connection = Faraday.new("http://localhost:3000")
    response = connection.post("/chats", data)

    params = JSON.parse(response.body)

    NewChat.new(params)
  end

  def self.fetch(chat_id)
    connection = Faraday.new("http://localhost:3000")
    response = connection.get("/chats/#{chat_id}")

    params = JSON.parse(response.body)

    NewChat.new(params)
  end

  def self.update_status(chat_id, status)
    data = {"status" => status}
   
    connection = Faraday.new "http://localhost:3000"
    response = connection.put "/chats/#{chat_id}", data
   
    params = JSON.parse(response.body)
    NewChat.new(params)
  end
end
