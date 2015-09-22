class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :article, index: true, foreign_key: true
      t.string :image_file_name
      t.string :image_file_type
      t.integer :image_size
      t.datetime :image_updated_at

      t.timestamps null: false
    end
  end
end
