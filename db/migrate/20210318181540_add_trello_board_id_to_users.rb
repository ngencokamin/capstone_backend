class AddTrelloBoardIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :trello_board_id, :string, :default => nil
  end
end
