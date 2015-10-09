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

  def max
    store.length
  end
end

class IntSet
  def initialize(max)
    @store = Array.new(max) { Array.new }
  end

  def insert(num)
    i = num % max
    @store[i] << num
  end

  def remove(num)
    i = num % max
    @store[i].delete(num)
  end

  def include?(num)
    i = num % max
    @store[i].include?(num)
  end

  private

  def max
    @store.length
  end
end

class ResizingIntSet
  def initialize(max)
    @store = Array.new(max) { Array.new }
    @num_elements = 0
  end

  def insert(num)
    resize! if size == num_elements
    i = num % size
    store[i] << num
    @num_elements += 1
  end

  def remove(num)
    i = num % size
    store[i].delete(num)
  end

  def include?(num)
    i = num % size
    store[i].include?(num)
  end

  def size
    store.size
  end

  def resize!
    old_store = store
    @num_elements = 0
    @store = Array.new(size * 2) { Array.new }
    old_store.each do |bucket|
      bucket.each do |element|
        insert(element)
      end
    end
  end

  private
  attr_reader :store, :num_elements
end
