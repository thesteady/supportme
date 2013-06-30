class AddCustomerIdToChats < ActiveRecord::Migration
  def change
    add_column :chats, :customer_id, :integer
  end
end
