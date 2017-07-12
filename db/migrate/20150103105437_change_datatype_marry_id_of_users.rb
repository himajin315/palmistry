class ChangeDatatypeMarryIdOfUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :marry_age, :text
  end
end
