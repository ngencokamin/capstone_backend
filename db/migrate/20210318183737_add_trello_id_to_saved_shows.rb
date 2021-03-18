class AddTrelloIdToSavedShows < ActiveRecord::Migration[6.0]
  def change
    add_column :saved_shows, :trello_id, :string
  end
end
