class RemoveDefaultFromUsersProfilePicture < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:users, :profile_picture, nil)
  end
end
