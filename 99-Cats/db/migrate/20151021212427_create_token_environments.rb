class CreateTokenEnvironments < ActiveRecord::Migration
  def change
    create_table :token_environments do |t|
      t.string :token
      t.string :browser
      t.string :device
      t.integer :user_id

      t.timestamps
    end
    add_index :token_environments, :user_id 
  end
end
