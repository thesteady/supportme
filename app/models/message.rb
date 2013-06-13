class Message < ActiveRecord::Base
  attr_accessible :content, :chat_id

  belongs_to :chat
end
