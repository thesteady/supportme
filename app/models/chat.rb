class Chat < ActiveRecord::Base
  attr_accessible :status

  has_many :messages

  belongs_to :customer
  belongs_to :user

  validates :status, presence: true
  validates :status, :inclusion => { :in => %w(waiting active resolved),
                     :message => "%{value} is not a valid status" }
end
