class Goal < ActiveRecord::Base
  after_initialize :ensure_completed_not_nil

  validates :user_id, :title, :exposure, presence: true
  validates :exposure, inclusion: { in: %w(public private) }

  belongs_to :user, inverse_of: :goals

  private
    def ensure_completed_not_nil
      self.completed ||= false
    end
end
