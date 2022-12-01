class AddTableToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :tell, :string
    add_column :orders, :table, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
