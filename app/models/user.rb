class User < ApplicationRecord
  has_secure_password
  
  has_many :comments
  has_many :votes
  
  validates :email, presence: true, uniqueness: true

end
