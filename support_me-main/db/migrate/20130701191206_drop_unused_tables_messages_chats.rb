class DropUnusedTablesMessagesChats < ActiveRecord::Migration
  def change
    drop_table :messages
    drop_table :chats
  end
end
