class AddAccessTokenToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :access_token, :string, :unique => true, :null => false, :limit => 8
  end
end
