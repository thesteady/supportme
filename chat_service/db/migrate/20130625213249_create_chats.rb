class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.integer :customer_id
      t.string  :status, default: "waiting"
      t.integer :user_id

      t.timestamps
    end
  end
end
