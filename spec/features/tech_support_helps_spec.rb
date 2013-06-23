require 'spec_helper'

describe 'Tech Support Helps' do
  
  describe 'going to the admin/support page' do
    context 'when there are no active customers waiting for help' do
      it 'gives a message that there are no customers' do
        login_user
        expect(page).to have_content('No one needs help at the moment.')
        expect(page).to_not have_content('# of Customers Waiting')
        expect(page).to_not have_content('You Are Working With:')
        expect(page).to have_content('No Active Chats.')
      end
    end

    context 'when there are customers waiting for help' do
      it 'has a list of chats with a count' do
        visit_page_with_a_waiting_chat
        expect(page).to have_content('Chat List')
        expect(page).to have_content('Chat #1')
        expect(page).to have_content('# of Customers Waiting')
      end
    end

    context 'when Ive started a chat' do
      it 'has a list of customers with whom I have started working with', js: true do
        visit_page_with_an_active_chat
        within('div#active-chats') do
          expect(page).to have_content('You Are Working With:')
          expect(page).to have_content('Chat #1')
        end
      end
    end

    context 'when I dont have an active chat' do
      it 'tells me that i have no active chats' do
        visit_page_with_a_waiting_chat
        expect(page).to have_selector('#active-chats')
        expect(page).to have_content('No Active Chats.')
      end
    end
  end

  describe 'start chatting with customer' do
    before(:each) do
      visit_page_with_a_waiting_chat
      click_link 'Chat #1'
    end

    it 'lets the user open a customer chat' do
      expect(current_path).to eq '/admin/chats/1'
      expect(page).to have_content('Hello Mr. Goat.')
    end

    it 'lets the user chat with a customer and provides author names', js: true do
      fill_in :message_content, with: 'hello i am chatting now!'
      click_link_or_button 'Send'
      within('#chat') do
        expect(page).to have_content('hello i am chatting now!')
        # expect(page).to have_selector('chat-author')
      end

      # within('#chat-author') do
      #   expect(page).to have_content('Gooaaat')
      # end
    end
  end

  describe 'resolving a chat-issue' do
    before(:each) do
      visit_page_with_an_active_chat
    end

    context 'when the chat is finished and the issue is resolved' do
      it 'lets me mark the issue is resolved' do
        pending 'next step?'
        click_link 'Chat #1'
        click_button 'Resolve Issue'
        #expect flash notice issue resolved
        #expect to not have that chat on the page anywhere any more
        #expect the status of that chat to be resolved
      end

      it 'no longer shows the chat in the list of waiting or in process customers' do
        pending
        #
      end
    end
  end

  def login_user
    user = User.create(name: 'Gooaaat', email: 'yeaah@supportgoat.com', password: 'goats', password_confirmation: 'goats')
    visit '/'
    fill_in :email, with: 'yeaah@supportgoat.com'
    fill_in :password, with: 'goats'
    click_link_or_button 'Log in'
  end

  def visit_page_with_a_waiting_chat
    customer = Customer.create( name: "Mr. Goat", email: "goat@farm.com" )
    customer.chats.create
    login_user
    # visit admin_chats_path
  end

  def visit_page_with_an_active_chat
    customer = Customer.create( name: "Mr. Goat", email: "goat@farm.com" )
    customer.chats.create(status: 'active')
    login_user
    # visit admin_chats_path
  end

end

