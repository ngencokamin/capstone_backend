class SavedShow < ApplicationRecord
  belongs_to :user
  belongs_to :media
  # validates :media_id, uniqueness: { scope: [:user_id] }
end
