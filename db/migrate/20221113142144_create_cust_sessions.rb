class CreateCustSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :cust_sessions do |t|
      t.integer :user_id
      t.integer :table
      t.string :tell
      t.timestamps
    end
  end
end