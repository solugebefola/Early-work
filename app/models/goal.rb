class Goal < ActiveRecord::Base
  validates :user_id, :title, :exposure, presence: true

  belongs_to :user, inverse_of: :goals
end
