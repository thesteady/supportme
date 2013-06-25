class Message < ActiveRecord::Base
  attr_accessible :content, :chat_id, :author_id, :author_type

  belongs_to :chat
  belongs_to :author, polymorphic: true

  validates :content, :chat_id, :author_id, :author_type, :presence => true

  # def author_name
  #   author.name
  # end
end
