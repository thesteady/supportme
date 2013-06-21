class Chat < ActiveRecord::Base
  attr_accessible :customer_id

  has_many :messages

  belongs_to :customer
  belongs_to :user
end