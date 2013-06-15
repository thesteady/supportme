require 'spec_helper'

describe MessagesController do
  describe 'POST create' do
    it 'creates a new message' do
      chat = Chat.create
      expect{
        post :create, message: {content: 'hi', chat_id: chat.id}
      }.to change(Message, :count).by(1)
    end
  end
end
