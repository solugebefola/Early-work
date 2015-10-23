class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, presence: true
      t.string :password_digest, presence: true

      t.timestamps
    end
    add_index :users, :password_digest
  end
end
