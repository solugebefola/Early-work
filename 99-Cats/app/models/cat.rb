class Cat < ActiveRecord::Base
  COLOR = %w[brown black white orange calico]

  validates :birth_date, :color, :name, :sex, :user_id, presence: true
  validates :color, inclusion: { in: COLOR }
  validates :sex, inclusion: { in: ["M", "F"] }

  has_many :cat_rental_requests, dependent: :destroy

  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )
end
