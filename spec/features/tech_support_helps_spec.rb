require 'spec_helper'

describe 'Tech Support Helps' do
  before(:each) do
    customer = Customer.create(
      name: "Mr. Goat",
      email: "goat@farm.com"
      )
    customer.chats.create
    visit admin_chats_path
  end

  describe 'going to the admin/support page' do
    it 'has a list of chats with a count' do

      expect(page).to have_content('Chat List')
      expect(page).to have_content('Open Chat #1')

      expect(page).to have_content('# of Customers Waiting')
    end
  end

  describe 'start chatting with customer' do
    it 'lets the user open a customer chat' do
      click_link 'Open Chat #1'
      expect(current_path).to eq '/admin/chats/1'
      expect(page).to have_content('Hello Mr. Goat.')
    end
  end
end
