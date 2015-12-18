class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.string :exposure, default: "public"
      t.integer :user_id, null: false, add_index: true

      t.timestamps
    end
  end
end
