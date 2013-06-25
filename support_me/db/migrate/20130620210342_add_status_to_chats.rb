class AddStatusToChats < ActiveRecord::Migration
  def change
    add_column :chats, :status, :string, default: 'waiting'
  end
end
