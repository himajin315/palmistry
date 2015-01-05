class AddTiwtterLinkToUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitter_link, :text
  end
end
