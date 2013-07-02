require 'spec_helper'

describe MessagesController do
  describe 'POST create' do
    before(:each) do
      @customer = Customer.create(name: 'goat', email: 'example@example.com')
      service = ChatService.new
      @chat = service.create_chat(@customer.id)
    end

    it 'creates a new message from a customer' do
      post :create, {:message => { content: 'hi',
                                   chat_id: @chat.id,
                                   author_id: @customer.id,
                                   author_type: "Customer"
                                 }
                    }
      expect(assigns(:message).content).to eq 'hi'
      expect(assigns(:message).name).to eq 'goat'
    end

    it 'creates a new message from a user' do
      user = User.create(name: 'Senor Goat', email: 'example@example.com', password: 'hello', password_confirmation: 'hello')
      
      post :create, {:message => 
                      { content: 'why, hello there!',
                         chat_id: @chat.id,
                         author_id: user.id,
                         author_type: 'User'
                       } }
      expect(assigns(:message).content).to eq 'why, hello there!'
      expect(assigns(:message).name).to eq 'Senor Goat'
    end
  end
end
