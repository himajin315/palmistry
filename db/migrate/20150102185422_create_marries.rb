class CreateMarries < ActiveRecord::Migration
  def change
    create_table :marries do |t|
      t.integer :age

      t.timestamps
    end
  end
end
