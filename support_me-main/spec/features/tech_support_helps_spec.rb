require 'spec_helper'

describe 'Tech Support Helps' do
  let(:customer) {Customer.create( name: "Mr. Goat", email: "example@example.com" )}
  
  describe 'going to the admin/support page' do
    context 'when there are no active customers waiting for help' do
      it 'gives a message that there are no customers' do
        VCR.use_cassette('no_existing_chats') do
          login_user

          expect(page).to have_content('No one needs help at the moment.')
          expect(page).to_not have_content('# of Customers Waiting')
          expect(page).to_not have_content('You Are Working With:')
          expect(page).to have_content('No Active Chats.')
        end
      end
    end

    context 'when there are customers waiting for help' do
      it 'has a list of chats with a count' do
        VCR.use_cassette('waiting_chats') do 
          visit_page_with_a_waiting_chat
          expect(page).to have_content('Waiting Chats (1)')
          expect(page).to have_content('Chat with 1')
        end
      end
    end

    context 'when Ive started a chat' do
      it 'has a list of customers with whom I have started working with', js: true do
        VCR.use_cassette('active_chats') do
          visit_page_with_an_active_chat
          within('div#active-chats') do
            expect(page).to have_content('Active Chats (1)')
            expect(page).to have_content('Chat with')
          end
        end  
      end
    end
  end

  describe 'start chatting with customer' do
    it 'lets the user open a customer chat', js: true do
      VCR.use_cassette('chat_with_customer') do
        #create a customer chat
        visit "/customers/new"
        fill_in :customer_name, with: "Mr. Goat"
        fill_in :customer_email, with: "example@example.com"
        click_link_or_button "Start Chat"

        #proceed with test.
        login_user
        click_link "Chat with 2"
        expect(current_path).to eq '/admin/support'
        expect(page).to have_content('Logged in as example@example.com')
      end
    end
  end

  describe 'resolving a chat-issue' do
    context 'when the chat is finished and the issue is resolved' do
      it 'lets me mark the issue is resolved', js: true do
        VCR.use_cassette('active_chat') do
          visit "/customers/new"
          fill_in :customer_name, with: "Mr. Goat"
          fill_in :customer_email, with: "example@example.com"
          click_link_or_button "Start Chat"

          #proceed with test.
          login_user
          click_link "Chat with 2"
          within('div#inner_chatbox_2') do
            click_link_or_button 'Resolve'
          end
          within('div#active-chats') do
            expect(page).to_not have_content('Chat with 2')
          end

          within('div#waiting-chats') do
            expect(page).to_not have_content('Chat with 2')
          end
        end
      end
    end
  end

  def login_user
    user = User.create(name: 'Gooaaat', email: 'example@example.com', password: 'goats', password_confirmation: 'goats')
    visit '/'
    fill_in :email, with: 'example@example.com'
    fill_in :password, with: 'goats'
    click_link_or_button 'Log in'
  end

  def visit_page_with_a_waiting_chat
    service = ChatService.new
    chat = service.create_chat(customer.id)
    login_user
  end

  def visit_page_with_an_active_chat
    service = ChatService.new
    chat = service.create_chat(customer.id)
    chatservice = ChatService.new(chat.id)
    chatservice.update_status('active')    
    login_user
  end
end
