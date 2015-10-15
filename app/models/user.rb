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

  def completed_polls_sql
    polls = Poll.find_by_sql ['SELECT
    polls.*, COUNT(questions.id) AS num_questions, COUNT(responses.id) as num_responses
    FROM
      polls
      JOIN
      questions
      ON
      polls.id = questions.poll_id
      JOIN
      answer_choices
      ON
      questions.id = answer_choices.question_id
      JOIN
      responses
      ON
      answer_choices.id = responses.answer_id
    WHERE
    responses.user_id = ?
    GROUP BY
    polls.id
    HAVING
    num_questions = num_responses', id]
  end

  def completed_polls
    Poll
    .select('polls.*, COUNT(questions.id) AS num_questions, COUNT(responses.id) as num_responses')
    .joins('JOIN questions ON polls.id = questions.poll_id')
    .joins('JOIN answer_choices ON questions.id = answer_choices.question_id')
    .joins('JOIN responses ON answer_choices.id = responses.answer_id')
    .where('responses.user_id = ?', id)
    .group('polls.id')
    .having('num_questions = num_responses')
  end


end
