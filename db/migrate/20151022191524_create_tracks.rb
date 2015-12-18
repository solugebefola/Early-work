class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :album_id, presence: true
      t.string :name, presence: true
      t.text :lyrics

      t.timestamps
    end
    add_index :tracks, :album_id
    add_index :albums, :band_id
  end
end
