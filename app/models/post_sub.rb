class PostSub < ActiveRecord::Base
  validates :sub_id, :post_id, presence: true,
  validate_uniqueness_of :post_id, scope: [:sub_id]

  belongs_to(
    :sub,
    class_name: "Sub",
    foreign_key: :sub_id,
    primary_key: :id
  )

  belongs_to(
    :post,
    class_name: "Post",
    foreign_key: :post_id,
    primary_key: :id
  )

  
end
