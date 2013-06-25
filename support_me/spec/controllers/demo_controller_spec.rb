require 'spec_helper'

describe DemoController do
  describe "#create" do
    it "returns http success" do
      get :create
      expect(response).to be_redirect
      expect(response).to redirect_to demo_path(1)
    end
  end

  describe '#show' do
    it "displays a demo chat" do
      chat = Chat.create(customer_id: 1)
      get :show, id: chat.id
      expect(response).to be_ok
    end
  end
end
