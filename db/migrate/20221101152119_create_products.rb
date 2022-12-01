class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :catagory
      t.integer :price

      t.timestamps
    end
  end
end
