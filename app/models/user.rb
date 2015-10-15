class User < ActiveRecord::Base
  validates :user_name, presence: true
  validate :respondent_has_not_already_answered_question

  has_many(
    :authored_polls,
    class_name: "Poll",
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many(
    :responses,
    class_name: "Response",
    foreign_key: :user_id,
    primary_key: :id
  )

  def respondent_has_not_already_answered_question
    responses
  end
end
