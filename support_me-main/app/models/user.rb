class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :name,
                  :email,
                  :password,
                  :password_confirmation

  validates :name, presence: true              
  validates :email,    presence: true, uniqueness: true, format: { with: /.+@.+\..+/i }
  validates :password, presence: true, confirmation: true, on: :create

  has_many :chats
  has_many :messages, as: :author
end
