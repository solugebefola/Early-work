class Bench < ActiveRecord::Base
  validates :description, :lat, :lng, presence: true
  validates :lat, :lng, numericality: true

  def self.in_bounds(filterParams)
    puts filterParams
    bounds = filterParams[:bounds]
    min = filterParams[:minSeating]
    max = filterParams[:maxSeating]
    west_bound = bounds[:SouthWest][:lng].to_f
    south_bound = bounds[:SouthWest][:lat].to_f
    east_bound = bounds[:NorthEast][:lng].to_f
    north_bound = bounds[:NorthEast][:lat].to_f
    bigger_lat = [south_bound, north_bound].max
    smaller_lat = [south_bound, north_bound].min
    bigger_lng = [east_bound, west_bound].max
    smaller_lng = [east_bound, west_bound].min

    @benches = Bench
      .where(lat: smaller_lat..bigger_lat)
      .where(lng: smaller_lng..bigger_lng)
      .where(seating: min..max)
  end
end
