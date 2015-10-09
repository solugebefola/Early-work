class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    inbounds?(num)
    store[num] = true
  end

  def remove(num)
    inbounds?(num)
    store[num] = false
  end

  def include?(num)
    store[num]
  end

  private

  attr_reader :store

  def inbounds?(num)
    raise "Out Of Range" if num >= max || num < 0
  end
end

class IntSet
  def initialize(max)
    @store = Array.new(max) { Array.new }
  end

  def insert(num)

  end

  def remove(num)
  end

  def include?(num)
  end
end
