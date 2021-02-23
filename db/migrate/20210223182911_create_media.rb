class CreateMedia < ActiveRecord::Migration[6.0]
  def change
    create_table :media do |t|
      t.string :omdb_id
      t.string :title
      t.decimal :imdb_rating
      t.string :released
      t.text :plot
      t.string :poster

      t.timestamps
    end
  end
end
