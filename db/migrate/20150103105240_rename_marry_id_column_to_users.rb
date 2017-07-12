class RenameMarryIdColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :marry_id, :marry_age
  end
end
