class MakeCategoriesOfProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :category
    add_column :products, :category, :integer
  end
end
