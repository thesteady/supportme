class Message < ActiveRecord::Base
  attr_accessible :author_id, :author_type, :chat_id, :content

  validates :content, :author_id, :author_type, :chat_id, presence: true

  belongs_to :chat
end
