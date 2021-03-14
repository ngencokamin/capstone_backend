class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :media
  belongs_to :suggested_media, class_name: "Media"
  has_many :votes
  has_many :users, through: :votes

  validates :enjoyability, numericality: true, inclusion: { in: 1..10, message: "Value must be 1-10" }
  validates :similarity, numericality: true, inclusion: { in: 1..10, message: "Value must be 1-10" }
  
  validates :suggested_media_id, presence: true  
end
