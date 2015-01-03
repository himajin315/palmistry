class ChangeDatatypeMarryIdOfUsers < ActiveRecord::Migration
  def change
    change_column :users, :marry_age, :text
  end
end
