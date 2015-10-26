class Goal < ActiveRecord::Base
  validates :user_id, :title, :exposure, presence: true
  validates :exposure, inclusion: { in: %w(public private) }

  belongs_to :user, inverse_of: :goals
end
