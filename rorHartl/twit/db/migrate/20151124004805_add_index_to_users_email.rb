class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    #add_index adds an index on the email column of the users table
    add_index :users, :email, unique: true
  end
end
