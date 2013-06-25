require'spec_helper'

describe Message do
  describe 'validations' do
    # before(:each) do
    #   customer = Customer.create(name: 'Mr. Goat', email: 'example@example.com')
    #   @message = customer.messages.create(content: 'hello', chat_id: 1)
    # end

    let(:message){ Message.new( content: 'hello', chat_id: 1, author_id: 1, author_type: 'customer' ) }

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

    it 'has an author id and author type' do
      expect(message.author_id).to eq 1
      expect(message.author_type).to eq 'customer'
    end
  end

  describe 'creating from a user' do
    it 'converts user id into author id and type' do
      User.create(name: 'Mr. Goat', email: 'example@example.com', password: 'pass', password_confirmation: 'pass')
    end
  end

  describe 'creating from a customer' do
    it 'converts customer id into author id and type' do
      pending
    end
  end

  describe 'author id and type validation' do
    let(:message) { Message.new( content: 'hello', chat_id: 1 ) }

    it 'is not valid without an author id AND author type'
    it 'is valid only with a type of customer or user'
  end

  describe 'message author name' do
    it 'has one whether author is customer or user'
  end
end
