class User < ApplicationRecord
  has_secure_password
  validates :name, :email, :password, :password_confirmation, presence: true
  validates :password, :password_confirmation, length: { in: 6..20 }
  validates :email, uniqueness: true

  has_many :messages
end
