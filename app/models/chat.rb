class Chat < ActiveRecord::Base
  has_many :messages

  belongs_to :customer
  belongs_to :user
end