class AddQuantityToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :quantity, :integer, array: true, default: []
  end
end
