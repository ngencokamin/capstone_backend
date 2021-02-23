class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :media
  belongs_to :suggested_media, class_name: "Media"
  has_many :votes
  has_many :users, through: :votes
end
