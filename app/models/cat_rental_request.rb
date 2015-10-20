class CatRentalRequest < ActiveRecord::Base
validates :cat_id, :start_date, :end_date, presence:true
validates :status, inclusion: { in: %w(PENDING APPROVED DENIED)}
validate :rentals_do_not_conflict
validate :start_date_before_end_date

belongs_to :cat

private
  def rentals_do_not_conflict
    cat = self.cat
    requests = cat.cat_rental_requests
    if requests.any? { |request| check_date_conflicts(request) }
      errors[:cat_rental_request] << "cat is already rented for that timeframe."
    end
  end

  def check_date_conflicts(other_request)
    return false if other_request.status != 'APPROVED'
    [self.start_date, self.end_date].any? do |date|
      date.between?(other_request.start_date, other_request.end_date)
    end
  end

  def start_date_before_end_date
    if self.start_date > self.end_date
      errors[:cat_rental_request] << "start date occurs after end date"
    end
  end

end
