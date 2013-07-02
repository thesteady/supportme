require 'spec_helper'

describe ChatService do
  def create_chat(id)
    customer = Customer.create(name: 'Mr. Goat', email: 'example@example.com')
    service  = ChatService.new(id)
    service.create_chat(customer.id)
  end

  context "#initialize" do
    it "creates a new ChatService with a chat_id" do
      result = ChatService.new(1)
      expect(result.chat_id).to eq 1
    end
  end

  context "#connection" do
    it "creates a new Faraday connection to http://localhost:3000" do
      url    = "http://localhost:3000/"
      result = ChatService.connection

      expect(result.class).to eq Faraday::Connection
      expect(result.url_prefix.to_s).to eq url
    end
  end

  context "#create_chat" do
    it "creates a chat" do
      chat_id     = 1
      customer_id = 5

      service = ChatService.new(chat_id)
      result  = service.create_chat(5)

      expect(result.class).to eq Chat
      expect(result.customer_id).to eq customer_id
      expect(result.status).to eq 'waiting'
    end
  end

  describe '#fetch_chat' do
    it 'returns a chat' do
      chat    = create_chat(1)
      service = ChatService.new(chat.id)
      result  = service.fetch_chat

      expect(result.class).to eq Chat
      expect(result.id).to eq chat.id
      expect(result.customer_id).to eq chat.customer_id
    end
  end

  describe '#fetch_chats' do
    it 'returns all the chats' do
      service       = ChatService.new(1)
      original_size = service.fetch_chats.size
      chat          = create_chat(1)

      result = service.fetch_chats

      expect(result.class).to eq Array
      expect(result.size).to eq original_size + 1
      expect(result.last.id).to eq chat.id
    end
  end

  context "#update_status" do
    it "updates a chat status" do
      create_chat(1)

      service = ChatService.new(1)
      result  = service.update_status("active")
      expect(result.class).to eq Chat
      expect(result.status).to eq "active"
    end
  end

  context "#create_message" do
    it "creates a message" do
      create_chat(1)

      params = {
        message: {
          author_id: 1,
          author_type: "Customer",
          content: "hello, goat",
          chat_id: 1
        }
      }

      service = ChatService.new(1)
      result  = service.create_message(params)
      expect(result.class).to eq Message
      expect(result.author_id).to eq 1
      expect(result.author_type).to eq "Customer"
      expect(result.content).to eq "hello, goat"
      expect(result.chat_id).to eq 1
    end
  end

  context "#fetch_messages" do
    it "fetches all the messages from a given chat" do

      user = User.create(name: 'Workin Goat', email: 'example@example.com', password: 'hello', password_confirmation: 'hello')
      customer = Customer.create(name: 'Tony', email: 'example@example.com')
     
      params_1 = {
        message: {
          author_id: customer.id,
          author_type: "Customer",
          content: "hello, goat",
          chat_id: 1
        }
      }

      params_2 = {
        message: {
          author_id: user.id,
          author_type: "User",
          content: "goodbye, goat",
          chat_id: 1
        }
      }

      service       = ChatService.new(1)
      original_size = service.fetch_messages.size

      service.create_message(params_1)
      service.create_message(params_2)

      result = service.fetch_messages

      expect(result.class).to eq Array
      expect(result.size).to eq original_size + 2
    end
  end
end
