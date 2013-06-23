class Message < ActiveRecord::Base
  attr_accessible :content, :chat_id, :customer_id, :user_id

  belongs_to :chat

  validates :content, :chat_id, :presence => true

  validate :customer_or_user_id, :on => :create
 

  def customer_or_user_id
    if no_author_assigned?
      errors.add(:must_have_author, "Message must have an author.")
    elsif customer_and_user_ids?
      errors.add(:only_one_author, "Message can only have one author.")
    else
      return true
    end
  end

  def no_author_assigned?
    customer_id && user_id
  end

  def customer_and_user_ids?
    !customer_id && !user_id
  end
end
