class QuestionFollow
  def self.find_by_id(id)
    results = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL

    QuestionFollow.new(results.first)
  end

  def self.find_by_user_id(user_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        user_id = ?
    SQL

    results.map { |result| QuestionFollow.new(result) }
  end

  def self.followers_for_question_id(question_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        users
      JOIN
        question_follows
      ON users.id = question_follows.user_id
        AND question_follows.question_id = ?

    SQL

    results.map { |result| User.new(result) }
  end

  def self.followed_questions_for_user_id(user_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_follows
      ON questions.id = question_follows.question_id
        AND question_follows.user_id = ?
    SQL

    results.map { |result| Question.new(result) }
  end

  def self.find_by_question_id(question_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        question_id = ?
    SQL

    results.map { |result| QuestionFollow.new(result) }
  end

  def self.most_followed_questions(n)
    results = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_follows
      ON  questions.id = question_follows.question_id

      GROUP BY
        questions.id
      ORDER BY
        COUNT(question_follows.id) DESC
      LIMIT ?

    SQL

    results.map { |result| Question.new(result) }
  end

  def initialize(results)
    @id, @user_id, @question_id =
    results.values_at('id', 'user_id', 'question_id')
  end
end
