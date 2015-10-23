class Post < ActiveRecord::Base
  validates :author_id, :sub_id, :title, presence: true

  belongs_to(
    :sub,
    class_name: "Sub",
    foreign_key: :sub_id,
    primary_key: :id
  )

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many(
    :sub_posts,
    class_name: "SubPost",
    foreign_key: :post_id,
    primary_key: :id
  )

  has_many(
    :subs,
    through: :sub_posts,
    source: :sub
  )


end
