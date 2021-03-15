class AddProfanityFilterToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :profanity_filter, :boolean, :default => false
  end
end
