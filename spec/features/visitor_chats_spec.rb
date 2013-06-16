require 'spec_helper'


describe 'visitor views the home page' do

  describe 'visitor chats' do
    it 'lets a visitor start a chat' do
      visit '/'

      click_link 'Try our demo'
      expect(current_path).to eq '/demo/1'

      fill_in :message_content, with: 'hello'
      click_button 'Send'
      expect(page).to have_content('hello')
    end
  end

  describe 'visitor signs up for an account' do
    it 'lets a visitor make a new account' do
      pending 'why doesnt this work??????'
      visit '/'
      click_link 'Sign up'
      fill_in :email, with: 'what@what.com'
      fill_in :password, with: 'hello'
      fill_in :user_password_confirmation, with: 'hello'
      click_link_or_button 'Create account'

      expect(page).to have_content('Your account was created.')
    end 
  end

  describe 'visitor logs in to existing account' do
  end
end
