class AddFavoriteMediaIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :favorite_media_id, :integer
  end
end
