require'spec_helper'

describe Message do
  describe 'validations' do
    let(:message){ Message.new(content: 'hello', chat_id: 1, customer_id: 1) }

    it 'is not valid without content' do
      message.content = nil
      expect(message).to_not be_valid
    end
    it 'is not valid with only whitespace content' do
      message.content = '    '
      expect(message).to_not be_valid
    end

    it 'is not valid without a chat id' do
      message.chat_id = nil
      expect(message).to_not be_valid
    end

  
  end

  describe 'author id validation' do
    let(:message) { Message.new( content: 'hello', chat_id: 1 ) }

    it 'is valid with a customer id' do
      message.customer_id = 1
      expect(message).to be_valid
    end

    it 'is valid with a user id' do
      message.user_id = 1
      expect(message).to be_valid
    end

    it 'is not valid without a customer or user id' do
      expect(message).to_not be_valid
    end

    it 'is not valid with a customer id AND a user id' do
      message.user_id = 1
      message.customer_id = 42
      expect(message).to_not be_valid
    end


  end
end
