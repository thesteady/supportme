require 'spec_helper'

describe Admin::ChatsController do
  
  let(:chat) { Chat.create(customer_id: 1) }

  describe 'GET index' do
    it 'renders the index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template(:index)
    end

    it 'assigns the waiting chats variable' do
      get :index
      expect(assigns(:waiting_chats)).to eq([chat])
    end

    it 'assigns the active chats variable' do
      chat.status = 'active'
      chat.save

      get :index
      expect(assigns(:active_chats)).to eq([chat])
    end
  end

  describe 'GET show' do
    it 'renders the show template' do
      get :show, { id: chat.id }
      expect(response).to be_ok
      expect(response).to render_template(:show)
    end

    it 'assigns the chat variable' do
      get :show, {id: chat.id}
      expect(assigns(:chat)).to eq(chat)
    end

    it 'assigns the messages variable' do
      message = chat.messages.create(content: 'hello')
      get :show, {id: chat.id}
      expect(assigns(:messages)).to eq([message])
    end
  end
end
