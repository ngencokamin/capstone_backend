class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :comment_id
      t.integer :value

      t.timestamps
    end
  end
end
