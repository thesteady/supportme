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

      expect(chat.status).to eq 'active'
    end
  end

  describe 'create message' do
    it 'creates a new message for a chat' do
      params = {"message" => {
                                "author_id" => "1",
                                "author_type" => 'User',
                                "chat_id" => "1",
                                "content" => 'wheres the goats?'}
                              }
      
      result = ChatService.create_message(params)
      expect(result.author_id).to eq 1
      expect(result.author_type).to eq 'User'
      expect(result.chat_id).to eq 1 
      expect(result.content).to eq 'wheres the goats?'
    end
  end
end
