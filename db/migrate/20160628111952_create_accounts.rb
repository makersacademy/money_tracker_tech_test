class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.float :balance
      t.float :deposit
      t.float :withdrawal

      t.timestamps null: false
    end
  end
end
