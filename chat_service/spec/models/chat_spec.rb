require 'spec_helper'

describe Chat do
  it 'is not valid without a customer id' do
    expect(Chat.create).to be_invalid
  end

  it 'creates a Chat when given the correct params' do
    expect(Chat.create(customer_id: 1)).to be_valid
  end
end
