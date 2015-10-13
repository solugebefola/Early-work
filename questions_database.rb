require 'singleton'
require 'sqlite3'
require 'byebug'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')

    self.results_as_hash = true
    self.type_translation = true
  end
end

class User
  def self.find_by_id(id)
    results = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    User.new(results.first)

  end

  def initialize(results)
    @id, @fname, @lname =
    results.values_at('id', 'fname', 'lname')

  end
end

class Question
  def self.find_by_id(id)
    results = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    Question.new(results.first)

  end

  def initialize(results)
    @id, @title, @body, @author_id =
    results.values_at('id', 'title', 'body', 'author_id')
  end
end

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

  def initialize(results)
    @id, @user_id, @question_id =
    results.values_at('id', 'user_id', 'question_id')
  end
end

class Reply
  def self.find_by_id(id)
    results = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    Reply.new(results.first)

  end

  def initialize(results)
    @id, @question_id, @user_id, @parent_reply_id =
    results.values_at('id', 'question_id', 'user_id', 'parent_reply_id')
  end
end

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

  def initialize(results)
    @id, @question_id, @user_id =
    results.values_at('id', 'question_id', 'user_id')
  end
end
