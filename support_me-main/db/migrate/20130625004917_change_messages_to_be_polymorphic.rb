class ChangeMessagesToBePolymorphic < ActiveRecord::Migration
  def change
    remove_column :messages, :user_id
    remove_column :messages, :customer_id
    add_column :messages, :author_id, :integer
    add_column :messages, :author_type, :string 
  end
end
