require 'spec_helper'

describe Admin::ChatsController do
  
  let(:chat) { Chat.create(customer_id: 1) }
  let(:user) {User.create(name: 'myrna', email: 'myrna@myrna.com', password: 'myrna', password_confirmation: 'myrna')}
  
  before(:each) do
    controller.stub(:current_user).and_return(user)
  end

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
      message = chat.messages.create(content: 'hello', customer_id: chat.customer_id)
      get :show, {id: chat.id}
      expect(assigns(:messages)).to eq([message])
    end
  end
end
