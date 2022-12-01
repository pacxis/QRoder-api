class ChangeCartProductType < ActiveRecord::Migration[6.1]
  def change
    remove_column :carts, :products
    add_column :carts, :products, :integer, array: true, default: []
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
