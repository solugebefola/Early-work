class AddIndexToSubs < ActiveRecord::Migration
  def change
    add_index :subs, :mod_id
  end
end
