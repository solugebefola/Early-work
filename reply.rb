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

  def initialize(results)
    @id, @question_id, @user_id, @parent_reply_id, @body =
    results.values_at('id', 'question_id', 'user_id', 'parent_reply_id', 'body')
  end

end
