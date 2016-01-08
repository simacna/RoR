class AddRememberDigestToUsers < ActiveRecord::Migration
  def change
    # our command to create this migration was:
    # rails generate migration add_remember_digest_to_users remember_digest:string
    # it ends in _to_users to tell Rails the migration is designed to alter the users table in database
    add_column :users, :remember_digest, :string
  end
end
