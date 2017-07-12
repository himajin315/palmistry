class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :uname
      t.integer :sex
      t.integer :palm_id
      t.integer :marry_id

      t.timestamps
    end
  end
end
