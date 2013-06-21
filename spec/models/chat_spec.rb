require 'spec_helper'

describe Chat do
  describe 'status validations' do
    it 'is invalid without a status' do
      expect(Chat.new(status: nil)).to be_invalid
    end

    it 'is invalid with a status other than waiting, active, or resolved' do
      expect(Chat.new(status: 'what?')).to be_invalid
      expect(Chat.new(status: ' ')).to be_invalid
      expect(Chat.new(status: 123)).to be_invalid

      expect(Chat.new(status: 'active')).to be_valid
      expect(Chat.new(status: 'resolved')).to be_valid
      expect(Chat.new(status: 'waiting')).to be_valid
    end

    it 'has a default status of waiting' do
      chat = Chat.create
      expect(chat.status).to eq 'waiting'
    end
  end

  describe 'customer id validations' do
    it 'is invalid without a customer id' do
      pending 'JORGE: do we have this? do we need it?'
    end
  end
end
