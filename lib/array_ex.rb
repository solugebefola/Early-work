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
    pair_indexes = []
    pair_indexes
  end
end
