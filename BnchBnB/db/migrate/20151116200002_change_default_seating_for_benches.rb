class ChangeDefaultSeatingForBenches < ActiveRecord::Migration
  def change
    change_column :benches, :seating, :integer, default: 2
  end
end
