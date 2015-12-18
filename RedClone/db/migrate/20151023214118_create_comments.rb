class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content, presence: true
      t.integer :author_id, presence: true
      t.integer :post_id, presence: true

      t.timestamps
    end
    add_index :comments, :author_id
    add_index :comments, :post_id
  end
end
