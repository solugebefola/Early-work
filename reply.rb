class Reply < ModelBase
  TABLE_NAME = 'replies'

  def self.find_by_question_id(question_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL

    results.map { |result| Reply.new(results) }
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

    results.map { |result| Reply.new(results) }
  end

  def self.find_by_parent_reply_id(parent_reply_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, parent_reply_id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_reply_id = ?
    SQL
    results.map { |result| Reply.new(results) }

  end

  attr_reader :id, :question_id, :user_id, :parent_reply_id, :body

  def initialize(results)
    @id, @question_id, @user_id, @parent_reply_id, @body =
    results.values_at('id', 'question_id', 'user_id', 'parent_reply_id', 'body')
  end

  def save
    case id
    when nil
      QuestionsDatabase.instance.execute(
        <<-SQL, question_id, user_id, parent_reply_id, body)
      INSERT INTO
        replies(question_id, user_id, parent_reply_id, body)
      VALUES
        (?, ?, ?, ?)
      SQL
    else
      QuestionsDatabase.instance.execute(
        <<-SQL, question_id, user_id, parent_reply_id, body, id)
      UPDATE
        replies
      SET
        question_id = ?, user_id = ?, parent_reply_id = ?, body = ?
      WHERE
        id = ?
      SQL
    end
  end

  def author
    User::find_by_id(user_id)
  end

  def question
    Question::find_by_id(question_id)
  end

  def parent_reply
    Reply::find_by_id(parent_reply_id)
  end

  def child_replies
    Reply::find_by_parent_reply_id(id)
  end


end
