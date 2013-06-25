class Customer < ActiveRecord::Base
  attr_accessible :email,
                  :name

  validates :email, presence: true, uniqueness: true, format: { with: /.+@.+\..+/i }
  validates :name,  presence: true, uniqueness: true

  has_many :chats
  has_many :messages, as: :author #, through chats........

end
