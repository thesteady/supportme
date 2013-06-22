require 'spec_helper'

describe Admin::ChatsController do

  describe 'GET index' do
    it 'renders the index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template(:index)
    end

    it 'assigns the waiting chats variable' do
      chat = Chat.create
      get :index
      expect(assigns(:waiting_chats)).to eq([chat])
    end

    it 'assigns the active chats variable' do
      chat = Chat.create(status: 'active')
      get :index
      expect(assigns(:active_chats)).to eq([chat])
    end
  end

  describe 'GET show' do
    it 'renders the show template' do
      chat = Chat.create
      get :show, { id: chat.id }
      expect(response).to be_ok
      expect(response).to render_template(:show)
    end

    it 'assigns the chat variable' do
      chat = Chat.create
      get :show, {id: chat.id}
      expect(assigns(:chat)).to eq(chat)
    end

    it 'assigns the messages variable' do
      chat = Chat.create
      message = chat.messages.create(content: 'hello')
      get :show, {id: chat.id}
      expect(assigns(:messages)).to eq([message])
    end
  end

  describe 'POST update' do
    it 'assigns the chat variable' do
      chat =Chat.create
      post :update, {id: chat.id}
      expect(assigns(:chat)).to eq chat
    end

    it 'sets the chat to resolved' do
      pending 'how do i get this to work?'
      # chat = Chat.create(status: 'active')
    
      # expect{      
      #   post :update, {id: chat.id}
      # }.to change(chat, :status).to('resolved')

      # expect(response).to redirect_to admin_chats_path      
    end
  end
end
