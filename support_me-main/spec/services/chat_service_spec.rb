require 'spec_helper'

describe ChatService do
  def create_chat(id)
    customer_id  = 5
    ChatService.create_chat(customer_id)
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

  context ".create" do
    it "creates a chat" do
      customer_id = 5
      new_chat = ChatService.create_chat(customer_id)
      
      expect(new_chat.customer_id).to eq customer_id
      expect(new_chat.status).to eq 'waiting'
    end
  end

  describe '.fetch_chat' do
    it 'returns the info given a valid chat id' do
      #how do we fake a chat from the other service?
      #USE VCR!!!!
      chat = create_chat(1)
      chatservice = ChatService.new(chat.id)
      response = chatservice.fetch_chat
      expect(response).to be_kind_of Chat
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
      create_chat(1)

      params_1 = {
        message: {
          author_id: 1,
          author_type: "Customer",
          content: "hello, goat",
          chat_id: 1
        }
      }

      params_2 = {
        message: {
          author_id: 4,
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
