class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.integer :similarity
      t.integer :enjoyability
      t.integer :media_id
      t.integer :user_id
      t.integer :suggested_media_id

      t.timestamps
    end
  end
end
