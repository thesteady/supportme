class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :email,
                  :password,
                  :password_confirmation

  validates :password, presence: true, confirmation: true, on: :create
  validates :email,    presence: true, uniqueness: true

  has_many :chats
  has_many :messages, through: :chats
end
