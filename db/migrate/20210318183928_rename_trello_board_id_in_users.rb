class RenameTrelloBoardIdInUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :trello_board_id, :trello_list_id
  end
end
