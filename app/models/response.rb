class Response < ActiveRecord::Base
  validates :user_id, :answer_id, presence: true
  validate :check_repeat_responses

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
    if id.nil?
      question.responses
    else
      siblings = question.responses.where("id != ?", id)
    end

    #siblings.reject { |sibling| sibling == self }
  end

  # private
  def check_repeat_responses
    unless sibling_responses.where("user_id = ? AND answer_id = ?", user_id, answer_id).empty?
      errors[:response] << "user cannot respond to answer more than once"
    end
  end

end
