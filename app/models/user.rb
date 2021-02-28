class User < ApplicationRecord
  has_secure_password
  
  has_many :comments
  has_many :votes
  
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 8}
  validates :bio, length: { maximum: 500 }

end
