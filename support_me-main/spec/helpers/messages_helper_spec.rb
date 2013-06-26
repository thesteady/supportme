require 'spec_helper'

describe MessagesHelper do
  describe '#author_name' do
    context 'when the author is a customer' do
      it 'returns the name of the customer' do
        customer = Customer.create(name:'Mr. Goat', email: 'goat@farm.com')
        message = Message.create(content: 'hello', chat_id: 1, customer_id: customer.id)

        expect(author_name_for(message)).to eq customer.name
      end
    end
    
    context 'when the author is a user' do
      it 'returns the name of the user' do
        user = User.create(name: 'Goat Helper', email: 'goat@goatsupport.com', password: 'goat', password_confirmation: 'goat')
        message = Message.create(content:'how can i help you?', chat_id: 1, user_id: user.id)
        expect(author_name_for(message)).to eq user.name
      end
    end
  end
end
