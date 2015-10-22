class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name, presence: true

      t.timestamps
    end
    add_index :bands, :name
  end
end
