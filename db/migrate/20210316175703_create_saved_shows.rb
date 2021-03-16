class CreateSavedShows < ActiveRecord::Migration[6.0]
  def change
    create_table :saved_shows do |t|
      t.integer :user_id
      t.integer :media_id

      t.timestamps
    end
  end
end
