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

  def initialize(results)
    @id, @title, @body, @author_id =
    results.values_at('id', 'title', 'body', 'author_id')
  end
end
