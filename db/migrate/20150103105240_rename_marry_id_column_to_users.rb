class RenameMarryIdColumnToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :marry_id, :marry_age
  end
end
