class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :email,
                  :password,
                  :password_confirmation

  validates :email,    presence: true, uniqueness: true, format: { with: /.+@.+\..+/i }
  validates :password, presence: true, confirmation: true, on: :create

  has_many :chats
  has_many :messages, through: :chats
end
