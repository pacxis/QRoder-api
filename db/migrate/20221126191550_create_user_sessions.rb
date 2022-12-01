class CreateUserSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :user_sessions do |t|

      t.boolean :logged_in
      t.integer :user_id
      

      t.timestamps
    end
  end
end
