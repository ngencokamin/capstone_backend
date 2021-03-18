class AddDefaultToSavedShowsTrelloId < ActiveRecord::Migration[6.0]
  def change
    change_column :saved_shows, :trello_id, :string, :default => nil
  end
end
