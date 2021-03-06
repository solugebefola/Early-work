class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :user_id, presence:true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED)}
  # validate :rentals_do_not_conflict
  validate :start_date_before_end_date

  belongs_to :cat
  belongs_to :user

  def approve!
    self.status = 'APPROVED'
    requests = CatRentalRequest.where("cat_id = ?", self.cat_id)
                                .where("id != ?", self.id)
                                .where("status != 'DENIED'")
                                .where("start_date <= ?", self.end_date)
                                .where("end_date >= ?", self.start_date)
    requests.each do |request|
      if request.status == 'PENDING'
        request.status = 'DENIED'
        request.save!
      elsif request.status == 'APPROVED'
        self.status = 'DENIED'
      end
    end
    self.save!
  end

  def deny!
    self.status = 'DENIED'
    self.save!
  end

  def pending?
    self.status == 'PENDING'
  end

  private
  # def rentals_do_not_conflict
  #   return true unless self.status == 'APPROVED'
  #   cat = self.cat
  #   requests = cat.cat_rental_requests
  #   fail
  #   if requests.any? { |request| check_date_conflicts(request) && request.id != self.id }
  #     errors[:cat_rental_request] << "cat is already rented for that timeframe."
  #   end
  # end
  #
  # def check_date_conflicts(other_request)
  #   return true if self.start_date <= other_request.start_date && self.end_date >= other_request.end_date
  #   [self.start_date, self.end_date].any? do |date|
  #     date.between?(other_request.start_date, other_request.end_date)
  #   end
  # end

  def start_date_before_end_date
    if self.start_date > self.end_date
      errors[:cat_rental_request] << "start date occurs after end date"
    end
  end

end
