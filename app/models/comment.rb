class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :medium
  belongs_to :suggested_media, class_name: "Medium"
  has_many :votes
  has_many :users, through: :votes
end
