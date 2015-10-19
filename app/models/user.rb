class User < ActiveRecord::Base
  validates :username, presence: true
  validates :username, uniqueness: true

  has_many(
    :contacts,
    class_name: "Contact",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :contact_shares,
    class_name: "ContactShare",
    foreign_key: :user_id,
    primary_key: :id
  )

end
