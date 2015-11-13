class Bench < ActiveRecord::Base
  validates :description, :lat, :lng, presence: true
  validates :lat, :lng, numericality: true 
end
