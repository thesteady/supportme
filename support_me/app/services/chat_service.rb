require 'net/http'

class ChatService
  def create(customer_id)
    # Customer.find(customer_id).chats.create
    uri = URI('http://localhost:3000/chats')
    response = Net::HTTP.post_form(uri, 'customer_id' => customer_id)
    JSON.parse(response.body)
  end
end
