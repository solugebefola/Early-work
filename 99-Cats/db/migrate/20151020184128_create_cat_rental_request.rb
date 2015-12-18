class CreateCatRentalRequest < ActiveRecord::Migration
  def change
    create_table :cat_rental_requests do |t|
      t.integer :cat_id, presence: true, add_index: true
      t.date :start_date, presence: true
      t.date :end_date, presence: true
      t.string :status, default: 'PENDING'
    end
  end
end
