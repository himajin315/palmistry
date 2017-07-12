class AddTiwtterLinkToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :twitter_link, :text
  end
end
