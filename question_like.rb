class QuestionLike
  def self.find_by_id(id)
    results = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL

    QuestionLike.new(results.first)
  end

  def self.find_by_user_id(user_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL

    results.map { |result| QuestionLike.new(results) }
  end

  def self.find_by_question_id(question_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL

    results.map { |result| QuestionLike.new(results) }
  end

  def self.likers_for_question_id(question_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        users.*
      FROM
        users
      JOIN
        question_likes
        ON users.id = question_likes.user_id
      WHERE
        question_likes.question_id = ?
    SQL

    results.map { |result| User.new(result) }
  end

  def self.num_likes_for_question_id(question_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(*) AS num
      FROM
        question_likes
      WHERE
        question_likes.question_id = ?
      GROUP BY
        question_likes.question_id
    SQL

    results.first['num']
  end

  def self.liked_questions_for_user_id(user_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_likes
      ON question_likes.question_id = questions.id
      WHERE
        question_likes.user_id = ?
    SQL

    results.map { |result| Question.new(result) }
  end

  def self.most_liked_questions(n)
    results = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_likes
        ON
        question_likes.question_id = questions.id
      GROUP BY
        question_likes.question_id
      ORDER BY
        COUNT(question_likes.question_id) DESC
      LIMIT ?
    SQL

    results.map { |result| Question.new(result) }
  end

  def initialize(results)
    @id, @question_id, @user_id =
    results.values_at('id', 'question_id', 'user_id')
  end
end
