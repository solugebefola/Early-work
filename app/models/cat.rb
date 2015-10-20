class Cat < ActiveRecord::Base
  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: { in: ["brown", "black", "white", "orange", "calico"] }
  validates :sex, inclusion: { in: ["M", "F"] }

end
