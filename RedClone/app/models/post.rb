class Post < ActiveRecord::Base
  validates :author_id, :title, presence: true
  # validate :at_least_one_sub

  # belongs_to(
  #   :sub,
  #   class_name: "Sub",
  #   foreign_key: :sub_id,
  #   primary_key: :id
  # )

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many(
    :post_subs,
    class_name: "PostSub",
    foreign_key: :post_id,
    primary_key: :id,
    inverse_of: :post
  )

  has_many(
    :subs,
    through: :post_subs,
    source: :sub
  )

  # private
  # def at_least_one_sub
  #   return true unless self.sub_ids.empty?
  # end
end
