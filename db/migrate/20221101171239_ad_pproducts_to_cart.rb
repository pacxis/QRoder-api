class AdPproductsToCart < ActiveRecord::Migration[6.1]
  def change
    add_column :carts, :products, :text, array: true, default: []
  end
end
