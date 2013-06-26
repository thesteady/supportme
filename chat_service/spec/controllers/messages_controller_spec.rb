require 'spec_helper'

describe MessagesController do
  let(:chat) { Chat.create(customer_id: 1) }

  before :each do
    Message.create(
      author_id: 1,
      author_type: "Customer",
      content: "I love goats in the summer.",
      chat_id: chat.id
      )
    Message.create(
      author_id: 2,
      author_type: "User",
      content: "I love goats in the spring.",
      chat_id: chat.id
      )
  end

  describe 'GET index' do
    it 'assigns all the messages variable' do
      messages = Message.where(chat_id: chat.id)
      get :index, chat_id: chat.id
      expect(assigns(:messages)).to eq(messages)
    end
    it 'returns json' do
      get :index, chat_id: chat.id

      expect(response.header["Content-Type"]).to include "application/json"
    end
  end

  describe 'POST create' do
    it 'creates a new messages when given valid params' do
      expect{
        post :create, { 
          author_id: 1,
          author_type: "Customer",
          chat_id: chat.id,
          content: "I love goats in the winter."
        }
      }.to change(Message, :count).by(1)


      result = Message.last
      
      expect(result.class).to eq Message
      expect(result.author_id).to eq 1
      expect(result.author_type).to eq "Customer"
      expect(result.chat_id).to eq chat.id
      expect(result.content).to eq "I love goats in the winter."
    end

    it 'returns json' do
      post :create, { 
          author_id: 1,
          author_type: "Customer",
          chat_id: chat.id,
          content: "I love goats in the winter."
        }
        
      expect(response.header["Content-Type"]).to include "application/json"
    end
  end
end
