class CreateGoalComments < ActiveRecord::Migration
  def change
    create_table :goal_comments do |t|
      t.integer :goal_id, null: false
      t.integer :commenter_id, null: false
      t.text :body, null: false

      t.timestamps
    end
    add_index :goal_comments, :goal_id
    add_index :goal_comments, :commenter_id
  end
end
