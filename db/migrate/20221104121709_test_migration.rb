class TestMigration < ActiveRecord::Migration[6.1]
  def change
    change_column :carts, :user_id, :integer, :unique => true
  end
end
