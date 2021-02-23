class ChangeRatingPrecisionScale < ActiveRecord::Migration[6.0]
  def change
    change_column :media, :imdb_rating, :decimal, precision: 2, scale: 1
  end
end
