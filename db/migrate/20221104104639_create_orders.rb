class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.belongs_to :user
      t.boolean :status, default: false
      t.integer :products, array: true

      t.timestamps
    end
  end
end
