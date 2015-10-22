class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name, presence: true
      t.integer :band_id, presence: true
      t.string :live_vs_studio

      t.timestamps
    end
  end
end
