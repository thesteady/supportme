class Message < ActiveRecord::Base
  attr_accessible :content, :chat_id

  validates :content, :chat_id, :presence => true
  belongs_to :chat
end
