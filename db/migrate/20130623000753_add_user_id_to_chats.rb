class AddUserIdToChats < ActiveRecord::Migration
  def change
    add_column :chats, :user_id, :integer
  end
end
