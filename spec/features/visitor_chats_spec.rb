require 'spec_helper'

describe 'visitor chats' do
  it 'lets a visitor start a chat' do
    visit '/demo'
    click_button 'start chatting'
    expect(current_path).to eq '/demo/1'

    fill_in :message_content, with: 'hello'
    click_button 'Send'
    expect(page).to have_content('hello')
  end
end
