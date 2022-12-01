class AddQuantityToCarts < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :quantity, :integer, array: true, default: []
  end
end
