require 'spec_helper'

describe DemoController do
  describe "#create" do
    it "returns http success" do
      VCR.use_cassette('creating_a_chat') do
        get :create
        expect(response).to be_redirect
      end
    end
  end

  describe '#show' do
    it "displays a demo chat" do
        customer = Customer.create(name: 'Demo', email: 'example@example.com')
        chatservice = ChatService.new
        chat = chatservice.create_chat(customer.id)

        get :show, id: chat.id
        expect(response).to be_ok
    end
  end
end
