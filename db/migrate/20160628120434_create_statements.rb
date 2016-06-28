class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.float :balance
      t.float :deposit
      t.float :withdrawal

      t.timestamps null: false
    end
  end
end
