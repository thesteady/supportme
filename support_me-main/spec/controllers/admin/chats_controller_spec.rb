require 'spec_helper'

describe Admin::ChatsController do

  let(:chat) { Chat.new(id: 1, customer_id: 1, status: "waiting") }
  let(:user) { User.create(name: 'myrna',
                           email: 'example@example.com',
                           password: 'myrna',
                           password_confirmation: 'myrna') }

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
      pending 'these need some stubbing'
      get :index
      expect(assigns(:waiting_chats).first.id).to eq(chat.id)
    end

    it 'assigns the active chats variable' do
      pending 'these need some stubbing'
      chat.status = 'active'
      chat.save

      get :index
      expect(assigns(:active_chats)).to eq([chat])
    end
  end

  describe 'GET show' do
    context 'when a customer exists' do
      before(:each) do
        customer = Customer.create(name: "Mr. Goat", email: "goat@farm.com")
        session[:customer_id] = customer.id
      end

      it 'renders the show template' do
        get :show, id: chat.id
        expect(response).to be_ok
        expect(response).to render_template(:show)
      end

      it 'assigns the chat variable' do
        pending 'how do we appropriately stub the chat service here for what were returning?'
        get :show, id: chat.id
        expect(assigns(:chat).id).to eq(chat.id)

        expect(assigns(:chat).customer_id).to eq(chat.customer_id)
        expect(assigns(:chat).status).to eq(chat.status)
        expect(assigns(:chat).user).to eq(chat.user)
      end

      it 'assigns the messages variable' do
        pending 'what is best way to stub chat service message?'
        message = Message.new(
          content: 'hello',
          chat_id: chat.id,
          author_id: chat.customer_id,
          author_type: 'Customer'
          )
        get :show, id: chat.id
        expect(assigns(:messages)).to eq([message])
      end
    end

    context 'when a customer doesn\'t exist' do
      it 'redirects to root_path when the customer doesn\'t exist' do
        pending
        get :show, id: chat.id
        expect(response).to be_redirect
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'POST update' do
    before(:each) do
      customer = Customer.create(name: "Mr. Goat", email: "goat@farm.com")
      session[:customer_id] = customer.id
    end

    it 'assigns the chat variable' do
      post :update, {id: chat.id}
      expect(assigns(:chat).id).to eq chat.id
    end
  end
end
