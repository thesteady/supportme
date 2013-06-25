class AddCustomerIdAndUserIdToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :user_id, :integer
    add_column :messages, :customer_id, :integer
  end
end
