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

    results.map { |result| self.new(result) }
  end

  def get_variables
    self.instance_variables.map { |iv| self.instance_variable_get(iv) }
  end

  def get_question_marks
    self.instance_variables.map { |iv| iv.to_s[1..-1] + " = ?" }
  end

  def save
    case id
    when nil
      QuestionsDatabase.instance.execute(
        <<-SQL, get_variables.drop(1))
      INSERT INTO
        #{self.class::TABLE_NAME} (#{self.instance_variables.drop(1).map { |iv| iv.to_s[1..-1]}.join(", ")})
      VALUES
        (#{(['?'] * (self.instance_variables.count - 1)).join(", ")})
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
    else
      QuestionsDatabase.instance.execute(
        <<-SQL, get_variables.drop(1), id)
      UPDATE
        #{self.class::TABLE_NAME}
      SET
        #{get_question_marks.drop(1).join(", ")}
      WHERE
        id = ?
      SQL
    end
  end

  def self.opts_to_s(opts)
    str = []
    opts.each do |column, value|
      str << "#{column} = #{value}"
    end
    str.join(" AND ")
  end

  def self.where(opts)

    results = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        #{self::TABLE_NAME}
      WHERE
        #{opts_to_s(opts)}
    SQL

    results.map { |result| self.new(result) }
  end
end
