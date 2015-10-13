class User < ModelBase
  TABLE_NAME = "users"

  def self.find_by_name(fname, lname)
    results = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL

    results.map { |result| User.new(result) }
  end

  attr_reader :id
  attr_accessor :fname, :lname

  def initialize(results)
    @id, @fname, @lname =
    results.values_at('id', 'fname', 'lname')
  end

  def authored_questions
    Question::find_by_author_id(id)
  end

  def authored_replies
    Reply::find_by_user_id(id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(id)
  end

  def average_karma
    results = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        COALESCE(COUNT(question_likes.id), 0) / CAST(COUNT(DISTINCT questions.id) AS FLOAT) AS karma
      FROM
        questions
      LEFT OUTER JOIN
        question_likes
        ON questions.id = question_likes.question_id
      WHERE
        questions.author_id = ?
    SQL
    results.first["karma"].nil? ? 0 : results.first["karma"]
  end

end
