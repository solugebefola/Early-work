class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question_body
      t.integer :poll_id

      t.timestamps
    end
  end
end
