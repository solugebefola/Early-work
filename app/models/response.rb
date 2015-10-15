class Response < ActiveRecord::Base
  validates :user_id, :answer_id, presence: true
  validate :check_repeat_responses
  validate :author_self_response

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
  end

  private
  def check_repeat_responses
    unless sibling_responses.where("user_id = ? AND answer_id = ?", user_id, answer_id).empty?
      errors[:response] << "user cannot respond to answer more than once"
    end
  end

  def author_self_response
    if self.question.poll.author_id == user_id
      errors[:response] << "user cannot respond to own poll"
    end
  end
end
