require 'spec_helper'

describe ChatService do
  describe '.fetch' do
    it 'returns the info given a valid chat id' do
      #how do we fake a chat from the other service?
      #USE VCR!!!!

      response = ChatService.fetch(1)
      expect(response).to be_kind_of NewChat
    end
  end

  describe 'update status' do
    it 'sets the status of the chat' do
      chat_id = 4
      status = 'active'
      chat = ChatService.update_status(chat_id, status)
      puts chat.inspect

      expect(chat.status).to eq 'active'
    end
  end
end
