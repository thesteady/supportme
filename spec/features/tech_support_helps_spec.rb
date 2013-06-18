require 'spec_helper'

describe 'Tech Support Helps' do
  before(:each) do
    Chat.create
    visit admin_chats_path
  end
  
  describe 'going to the admin/support page' do
    it 'has a list of chats' do
 
      expect(page).to have_content('Chat List')
      expect(page).to have_content('Open Chat #1')
    end
  end

  describe 'start chatting with customer' do
    it 'lets the user open a customer chat' do
      click_link 'Open Chat #1'
      expect(current_path).to eq '/admin/chats/1'
      expect(page).to have_content('Chat #1')
      expect(page).to have_content('Send')

      fill_in :message_content, with: 'test'
      click_link_or_button 'Send'
      expect(page).to have_content('test')
    end
  end
end
