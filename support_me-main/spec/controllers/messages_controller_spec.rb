require 'spec_helper'

describe MessagesController do
  describe 'POST create' do
    it 'creates a new message from a customer' do
      chat = Chat.create(customer_id: 1)
      expect{
        post :create, {:message => { content: 'hi',
                                 chat_id: chat.id,
                                 author_id: chat.customer_id,
                                 author_type: "Customer"
                               } }
      }.to change(Message, :count).by(1)
    end

    it 'creates a new message from a user' do
      chat = Chat.create(customer_id: 1)
      expect{
        post :create, {:message => { content: 'why, hello there!',
                                 chat_id: chat.id,
                                 author_id: 1,
                                 author_type: 'User'
                               } }
      }.to change(Message, :count).by(1)
    end
  end
end
