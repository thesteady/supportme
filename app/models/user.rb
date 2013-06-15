class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :email,
                  :name,
                  :password,
                  :password_confirmation

  validates :password, presence: true, confirmation: true, on: :create
  validates :email,    presence: true, uniqueness: true
end
