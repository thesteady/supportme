class Chat < ActiveRecord::Base
  attr_accessible :status,
                  :customer_id,
                  :user_id
                  
  has_many :messages

  belongs_to :customer
  belongs_to :user

  validates :status, presence: true
  validates :customer_id, presence:true

  validates :status, inclusion: {
    in:      %w(waiting active resolved),
    message: "%{value} is not a valid status"
  }
end
