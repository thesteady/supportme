require 'spec_helper'

describe MessagesController do
  describe 'POST create' do
    it 'creates a new message from a customer' do
      # chat = Chat.create(customer_id: 1)

        post :create, {:message => { content: 'hi',
                                 chat_id: 1,
                                 author_id: 1,
                                 author_type: "Customer"
                               } }
      expect(response).to be_redirect
    end

    it 'creates a new message from a user' do
      # chat = Chat.create(customer_id: 1)

      post :create, {:message => 
                      { content: 'why, hello there!',
                         chat_id: 1,
                         author_id: 1,
                         author_type: 'User'
                       } }
      expect(response).to be_redirect
    end
  end
end
