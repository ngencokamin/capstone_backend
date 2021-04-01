class User < ApplicationRecord
  has_secure_password
  
  has_many :comments
  has_many :votes
  belongs_to :favorite_media, class_name: "Media", optional: true
  has_many :saved_shows
  has_many :media, through: :saved_shows
  
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  # validates :password, length: { minimum: 8}, :confirmation => true, :on => :create
  validates :bio, length: { maximum: 500 }

end
