class Chat < ActiveRecord::Base
  attr_accessible :customer_id
  
  validates :customer_id, presence: true
end
