class AddRatedToMedia < ActiveRecord::Migration[6.0]
  def change
    add_column :media, :rated, :string
  end
end
