require'spec_helper'

describe Message do
  it 'is not valid without content' do
    message = Message.new(content: nil, chat_id: 1)
    expect(message).to_not be_valid
  end
  it 'is not valid with only whitespace content' do
    message = Message.new(content: '    ', chat_id: 1)
    expect(message).to_not be_valid
  end

  it 'is not valid wihtout a chat id' do
    message = Message.new(content: 'hi', chat_id: nil)
    expect(message).to_not be_valid
  end
end
