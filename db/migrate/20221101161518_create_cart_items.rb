class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|

      t.belongs_to :cart
      t.integer :product_id

      t.timestamps
    end
  end
end
