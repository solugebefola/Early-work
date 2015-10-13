class ModelBase
  # TABLE_NAME =
  def self.find_by_id(id)
    results = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{self::TABLE_NAME}
      WHERE
        id = ?
    SQL

    self.new(results.first)
  end

  def self.all
    results = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        #{self::TABLE_NAME}
    SQL
  end
end
