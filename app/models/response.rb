class Response < ActiveRecord::Base
  validates :user_id, :answer_id, presence: true

  belongs_to(
    :answer_choice,
    class_name: "AnswerChoice",
    foreign_key: :answer_id,
    primary_key: :id
  )

  has_one(
    :question,
    through: :answer_choice,
    source: :question
  )

  belongs_to(
    :respondent,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  def sibling_responses
    siblings = question.responses
    siblings.reject { |sibling| sibling == self }
  end
end
