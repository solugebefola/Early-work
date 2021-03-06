class Question < ModelBase
  TABLE_NAME = "questions"

  def self.find_by_title(title)
    results = QuestionsDatabase.instance.execute(<<-SQL, title)
      SELECT
        *
      FROM
        questions
      WHERE
        title = ?
    SQL

    results.map { |result| Question.new(result) }
  end

  def self.find_by_author_id(author_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL

    results.map { |result| Question.new(result) }
  end

  def self.find_by_body(body)
    results = QuestionsDatabase.instance.execute(<<-SQL, body)
      SELECT
        *
      FROM
        questions
      WHERE
        body = ?
    SQL

    results.map { |result| Question.new(result) }
  end

  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end

  attr_reader :id, :title, :body, :author_id

  def initialize(results)
    @id, @title, @body, @author_id =
    results.values_at('id', 'title', 'body', 'author_id')
  end

  def author
    User::find_by_id(author_id)
  end

  def replies
    Reply::find_by_question_id(id)
  end

  def followers
    QuestionFollow.followers_for_question_id(id)
  end

  def likers
    QuestionLike.likers_for_question_id(id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(id)
  end
end
