class AddCompletedToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :completed, :boolean
    change_column_default :goals, :completed, false
    # change_column_null :goals, :completed, false
  end
end
