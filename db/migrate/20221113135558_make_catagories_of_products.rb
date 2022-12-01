class MakeCatagoriesOfProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :catagory
    add_column :products, :catagory, :integer
  end
end
