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

  attr_reader :id, :fname, :lname

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
end
