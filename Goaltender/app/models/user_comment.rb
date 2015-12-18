class UserComment < ActiveRecord::Base
  validates :user_id, :commenter_id, :body, presence: true

  belongs_to :user

  belongs_to(
    :commenter,
    class_name: "User",
    foreign_key: :commenter_id
    )
end
