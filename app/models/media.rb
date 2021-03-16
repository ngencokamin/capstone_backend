class Media < ApplicationRecord
  has_many :comments
  has_many :users
  has_many :saved_shows
  has_many :users, through: :saved_shows
end
