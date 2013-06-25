require 'spec_helper'

describe ChatsController do
  let(:chat) {Chat.create(customer_id: 1)}

  describe 'POST create' do
    it 'creates a new chat when given a customer id' do
      expect{
        post :create, customer_id: 1
      }.to change(Chat, :count).by(1)
      expect(Chat.first.customer_id).to eq 1
    end

    it 'should render json' do
      post :create, customer_id: 1
      response.header['Content-Type'].should include 'application/json'
    end
  end

  describe 'GET show' do
    it 'returns the chat given a valid chat id' do
      get :show, id: chat.id
      expect(assigns(:chat)).to eq chat
    end

    it 'renders json' do
      get :show, id: chat.id
      response.header['Content-Type'].should include 'application/json'
    end
  end

  describe 'POST update' do
    it 'updates the status attribute with params for active' do
      post :update, id: chat.id, status: 'active'
      expect(Chat.find(chat.id).status).to eq 'active'
    end

    it 'updates the status attribute with params resolved' do
      post :update, id: chat.id, status: 'resolved'
      expect(Chat.find(chat.id).status).to eq 'resolved'
    end

    it 'renders json' do
      post :update, id: chat.id, status: 'resolved'
      response.header['Content-Type'].should include 'application/json'
    end
  end
end
