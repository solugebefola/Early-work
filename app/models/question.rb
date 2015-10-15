class Question < ActiveRecord::Base
  validates :poll_id, :question_body, presence: true

  belongs_to(
    :poll,
    class_name: "Poll",
    foreign_key: :poll_id,
    primary_key: :id
  )

  has_many(
    :answer_choices,
    class_name: "AnswerChoice",
    foreign_key: :question_id,
    primary_key: :id
  )

  has_many(
    :responses,
    through: :answer_choices,
    source: :responses
  )

  def results_worst
    results = Hash.new(0)
    answer_choices.each do |answer|
      results[answer.answer_body] += answer.responses.count
    end
    results
  end

  def results_better
    results = Hash.new(0)
    answers = answer_choices.includes(:responses)
    answers.each do |answer|
      results[answer.answer_body] += answer.responses.length
    end

    results
  end

  def results_best
    answer_choices
    .joins('LEFT OUTER JOIN responses ON responses.answer_id = answer_choices.id')
    .where('answer_choices.question_id = ?', id)
    .group('answer_choices.answer_body')
    .count('responses.id')
  end
end
