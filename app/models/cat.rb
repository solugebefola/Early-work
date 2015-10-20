class Cat < ActiveRecord::Base
  COLOR = %w[brown black white orange calico]

  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: { in: COLOR }
  validates :sex, inclusion: { in: ["M", "F"] }

  has_many :cat_rental_requests

end
