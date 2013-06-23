require 'spec_helper'

describe Chat do
  describe 'validations' do
    it 'is invalid without a customer id' do
      expect(Chat.new).to be_invalid
    end
    
    it 'is invalid without a status' do
      expect(Chat.new(customer_id: 1, status: nil)).to be_invalid
    end

    it 'is invalid with a status other than waiting, active, or resolved' do
      expect(Chat.new(status: 'what?', customer_id: 1)).to be_invalid
      expect(Chat.new(status: ' ', customer_id: 1)).to be_invalid
      expect(Chat.new(status: 123, customer_id: 1)).to be_invalid

      expect(Chat.new(status: 'active', customer_id: 1)).to be_valid
      expect(Chat.new(status: 'resolved', customer_id: 1)).to be_valid
      expect(Chat.new(status: 'waiting', customer_id: 1)).to be_valid
    end

    it 'has a default status of waiting' do
      chat = Chat.create(customer_id: 1)
      expect(chat.status).to eq 'waiting'
    end
  end
end
