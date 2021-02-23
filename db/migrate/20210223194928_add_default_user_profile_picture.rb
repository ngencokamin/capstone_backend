class AddDefaultUserProfilePicture < ActiveRecord::Migration[6.0]
  def change
   change_column :users, :profile_picture, :string, default: "https://secondchancetinyhomes.org/wp-content/uploads/2016/09/empty-profile.png"
  end
end
