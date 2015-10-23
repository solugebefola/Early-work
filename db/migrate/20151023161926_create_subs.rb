class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.string :title, presence: true
      t.text :description, presence: true
      t.integer :mod_id, presence: true 

      t.timestamps
    end
  end
end
