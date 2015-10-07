class Array
  def my_uniq
    result = []
    arr_element = Hash.new(0)
    self.each do |el|
      arr_element[el] += 1
    end
    arr_element.keys

  end

  def two_sum
    pair_indices = []

    self.each_with_index do |el, i|
      self.each_index do |j|
        pair_index = [i, j]
        pair_indices << pair_index if self[i] + self[j] == 0 && j > i
      end
    end

    pair_indices
  end

  def my_transpose
    return self if self.empty?
    transposed = Array.new(self.first.size) { Array.new(self.size) }

    self.each_with_index do |row, row_idx|
      row.each_with_index do |element, col_idx|
        transposed[col_idx][row_idx] = element
      end
    end

    transposed
  end
end
